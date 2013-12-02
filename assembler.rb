@instructions = []
@labels = {}
@current_labels = []
@pc = 0

@op_padding = 10

0.upto(15) do |i|
  define_singleton_method("r#{i}") {i}
end

def regs
  0.upto(15).to_a
end

arith_ops = {
  add: 0b0101,
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

def labels_for(addr)
  ret = []
  @labels.each {|k,v| ret << k if v == addr}
  ret
end

def addr_for(label)
  s = label.to_s
  if s.end_with? '_lo'
    addr = @labels[s[0..-4].to_sym]
    throw "#{label.inspect} is undefined" unless addr
    return addr & 0xFF
  elsif s.end_with? '_hi'
    addr = @labels[s[0..-4].to_sym]
    throw "#{label.inspect} is undefined" unless addr
    return addr>>8 & 0xFF
  else
    addr = @labels[label]
    throw "#{label.inspect} is undefined" unless addr
    return addr
  end
end

def label(sym, addr=@pc)
  throw "duplicate label #{sym.to_s}" if @labels[sym]
  @labels[sym] = addr
end

class Fixnum
  def to_hex(nibbles=0)
    n = self
    if n < 0
      nibbles = 1 if nibbles == 0
      n = 2**(4 * nibbles) + n 
    end
    n.to_s(16).rjust(nibbles, '0')
  end
end

def op_s(nibbles, labels, op_text)
  hex = nibbles.map(&:to_hex).join.ljust(@op_padding)
  comment = "// "
  comment += labels.join(', ') + ": " unless labels.empty?
  comment += op_text
  hex + comment
end

def rem(comment)
  return if comment.empty?
  @instructions << lambda do
    comment.lines.map{|l| "// " + l}.join + "\n"
  end
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
  @instructions << lambda do
    hex = ''
    comment = labeled_comment(labels_for(pc), words)
    ws = [' ', '  ', ' ', "\n"]
    words.each do |w|
      throw "word #{w} is out of range" if w >= 2**16 || w < -2**15      
      hex += w.to_hex(4) + ws.rotate!.last
    end
    comment + hex.strip
  end
  @pc += words.size
  @pc -= 1 if words[0].is_a? String
end

def db(*bytes)
  pc = @pc
  @instructions << lambda do
    hex = ''
    comment = labeled_comment(labels_for(pc), bytes)
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

def pc_op(&proc)
  pc = @pc
  @instructions << lambda do
    nibbles, op_text = proc.call(pc)
    op_s(nibbles, [pc.to_hex(8)] + labels_for(pc), op_text)
  end
  @pc += 1
end

def op(opcode, a, ext, b, text)
  pc_op {[[opcode, a, ext, b], text]}
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
    text = "#{name}i #{a}, #{b.inspect}"
    if b.is_a?(Symbol)
      pc_op do |pc|
        [[opcode, a, addr_for(b)>>4 & 0xF, addr_for(b) & 0xF], text]
      end
    else
      throw "'b' out of range" if b < -128 || b > 255
      op opcode, a, b>>4 & 0xF, b & 0xF, text
    end
  end
end

for name, code in arith_ops
  arith_op(name.to_s, code)
end

def define_branch(cond, code)
  define_method("j#{cond}", lambda do |dest_reg|
    throw "'dest_reg' out of range" if dest_reg < 0 || dest_reg > 15
    op 0b0100,code,0b1100,dest_reg, "j#{cond} #{dest_reg}"
  end)
  define_method("b#{cond}", lambda do |disp|
    throw "'disp' out of range" if !disp.is_a?(Symbol) && (disp < -128 || disp > 127)
    pc_op do |pc|
      if disp.is_a?(Symbol)
        d = addr_for(disp) - pc
        throw "'disp' out of range" if d < -128 || d > 127
      else
        d = disp
      end
      [[0b1100,code,d>>4 & 0xF,d & 0xF], "b#{cond} #{disp.inspect}"]
    end
  end)  
end

for cond, code in conds
  define_branch(cond, code)
end

def jal(a, b)
  reg_op "jal", 0b0100,a,0b1000,b
end

def load(a, b)
  reg_op "load", 0b0100,a,0b0000,b
end

def stor(a, b)
  reg_op "stor", 0b0100,a,0b0100,b
end

def lsh(a, b)
  reg_op "lsh", 0b1000,a,0b0100,b
end

def lshi(a, b)
  throw "'a' out of range" if a < 0 || a > 15
  throw "'b' out of range" if b < -16 || b > 16
  op 0b1000,a,(b < 0 ? 1 : 0),b, "lshi #{a}, #{b}"
end

def clri
  op 0b0100,0b0000,0b1111,0b0000, "clri"
end

def nop
  op 0,0,0b1101,0, "nop" # mov r0, r0
end

def assemble_at(addr)
  assemble_at_address(addr)
end

def assemble_at_address(addr)
  @instructions << lambda {"@#{(addr).to_hex(8).ljust(@op_padding-1)}// start assembling at address #{addr.to_hex(8)}"}
  @pc = addr
end

def lo(label)
  (label.to_s + '_lo').to_sym
end

def hi(label)
  (label.to_s + '_hi').to_sym
end

def lea(reg, label)
  movi reg, lo(label)
  lui reg, hi(label)
end
