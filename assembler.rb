@instructions = []
@labels = {}
@current_labels = []
@pc = 0

@op_padding = 10

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
      if i.arity == 0
        f.puts i.call()
      else
        f.puts i.call(@labels)
      end
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
  hex = nibbles.map(&:to_hex).join.ljust(@op_padding)
  comment = "// "
  comment += labels.join(', ') + ": " unless labels.empty?
  comment += op_text
  hex + comment
end

def labeled_comment(labels, comment)
  res = ''
  res += labels.join(', ') + ": " unless labels.empty?
  if comment.is_a? String
    res += comment unless comment.empty?
  elsif comment[0].is_a? String
    res += comment.shift
  end
  res = res.lines.map{|l| "// " + l}.join + "\n" unless res.empty?
  res
end

def dw(*words)
  pc = @pc
  current_labels = @current_labels
  @instructions << lambda do
    hex = ''
    comment = labeled_comment(current_labels, words)
    ws = [' ', '  ', ' ', "\n"]
    words.each do |w|
      throw "word #{w} is out of range" if w >= 2**16 || w < -2**15      
      hex += w.to_hex(4) + ws.rotate!.last
    end
    comment + hex.strip
  end
  @pc += words.size
  @pc -= 1 if words[0].is_a? String
  @current_labels = []
end

def db(*bytes)
  pc = @pc
  current_labels = @current_labels
  @instructions << lambda do
    hex = ''
    comment = labeled_comment(current_labels, bytes)
    ws = [' ', '  ', ' ', "\n"]
    while not bytes.empty?
      hex += bytes.shift.to_hex(2)
      hex += bytes.empty? ? '00' : bytes.shift.to_hex(2)
      hex += ws.rotate!.last
    end
    comment + hex.strip
  end
  len = bytes.size
  len -= 1 if bytes[0].is_a? String
  len += 1 if len.odd?
  @pc += len / 2
  @current_labels = []
end

def ds(*args)
  if args.size > 1
    comment = args.shift
    string = args.join
  else
    string = args.shift
    comment = '"' + string + '"'
  end
  throw "string #{string} is too long" if string.size > 255
  db(comment, string.size, *string.bytes)
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
  @instructions << lambda {"@#{(addr).to_hex(8).ljust(@op_padding-1)}// start assembling at address #{addr.to_hex(8)}"}
  @pc = addr
end
