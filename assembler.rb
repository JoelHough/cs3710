@instructions = []
@labels = {}
@current_labels = []
@pc = 0

0.upto(15) do |i|
  define_singleton_method("r#{i}") {i}
end

arith_ops = {
  add: 0b1010,
  sub: 0b1001,
  cmp: 0b1011,
  _and: 0b0001,
  _or: 0b0010,
  xor: 0b0011,
  mov: 0b1101,
  lu: 0b1111}

conds = Hash[%w(eq ne cs cc hi ls gt le fs fc lo hs lt ge uc).zip(0..1.0/0)]

def assemble(filename, &block)
  yield block
  File.open(filename, 'w') do |f|
    @instructions.each do |i|
      f.puts i.call(@labels)
    end
  end
end

def label(sym)
  throw "duplicate label #{sym.to_s}" if @labels[sym]
  @labels[sym] = @pc
  @current_labels << sym
end

class Fixnum
  def to_hex(nibbles=0)
    self.to_s(16).rjust(nibbles, '0')
  end
end

def op_s(nibbles, labels, op_text)
  hex = nibbles.map(&:to_hex).join.ljust(8)
  comment = "// "
  comment += labels.join(', ') + ": " unless labels.empty?
  comment += op_text
  hex + comment
end

def label_op(&proc)
  pc = @pc
  current_labels = @current_labels
  @instructions << lambda do |labels|
    nibbles, op_text = proc.call(pc, labels)
    op_s(nibbles, [pc.to_hex(8)] + current_labels, op_text)
  end
  @current_labels = []
  @pc += 1
end

def op(opcode, a, ext, b, text)
  label_op {[[opcode, a, ext, b], text]}
end

def reg_op(name, opcode, a, ext, b)
  throw "'a' out of range" if a < 0 || a > 15
  throw "'b' out of range" if b < 0 || b > 15
  op opcode, a, ext, b, "#{name} #{a}, #{b}"
end

def arith_op(name, opcode)
  throw "'opcode' out of range" if opcode < 0 || opcode > 15
  define_singleton_method(name) do |a, b|
    reg_op name, 0, a, opcode, b
  end
  define_singleton_method("#{name}i") do |a, b|
    throw "'a' out of range" if a < 0 || a > 15
    throw "'b' out of range" if b < -128 || b > 255
    op opcode, a, b>>4 & 15, b & 15, "#{name}i #{a}, #{b}"
  end
end

for name, code in arith_ops
  arith_op(name.to_s, code)
end

for cond, code in conds
  define_singleton_method("j#{cond}") do |dest_reg|
    throw "'dest_reg' out of range" if dest_reg < 0 || dest_reg > 15
    op 0b0100,code,0b1100,dest_reg, "j#{cond} #{dest_reg}"
  end
  define_singleton_method("b#{cond}") do |disp|
    throw "'disp' out of range" if !disp.is_a?(Symbol) && (disp < -128 || disp > 127)
    label_op do |pc, labels|
      if disp.is_a?(Symbol)
        d = labels[disp] - pc
        throw "'disp' out of range" if d < -128 || d > 127
      else
        d = disp
      end
      [[0b1100,code,d>>4 & 15,d & 15], "b#{cond} #{disp.inspect}"]
    end
  end
end

def load(a, b)
  reg_op "load", 0b0100,a,0b0000,b
end

def stor(a, b)
  reg_op "stor", 0b0100,a,0b0100,b
end

def assemble_at_address(addr)
  @instructions << lambda {|labels| "@#{(addr).to_hex.ljust(6)}// start assembling at address #{addr.to_hex(8)}"}
  @pc = addr
end
