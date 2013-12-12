@instructions = []
@labels = {}
@gen_labels = []
@current_labels = []
@pc = 0

@op_padding = 10

class Register
  def initialize(i, name=nil)
    @i = i
    @name = name || "r#{i}"
  end
  def to_i
    @i
  end
  def to_s
    @name
  end
end

0.upto(12) do |i|
  define_singleton_method("r#{i}") {Register.new(i)}
end

define_singleton_method("psr") {Register.new(13, 'psr')}
define_singleton_method("rs") {Register.new(14, 'rs')}
define_singleton_method("ps") {Register.new(15, 'ps')}

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

def gen_label(root)
  i = 0
  l = nil
  loop do
    l = "#{root}_#{i}".to_sym
    break unless @labels.include?(l) || @gen_labels.include?(l)
    i += 1
  end
  @gen_labels << l
  l
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

def label(sym, addr=@pc, &proc)
  throw "duplicate label #{sym.to_s}" if @labels[sym]
  @labels[sym] = addr
  proc.call if proc
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
  throw "'a' must be a register" unless a.is_a? Register
  throw "'b' must be a register" unless b.is_a? Register
  op opcode, a.to_i, ext, b.to_i, "#{name} #{a}, #{b}"
end

def arith_op(name, opcode)
  throw "'opcode' out of range" if opcode < 0 || opcode > 15
  define_singleton_method(name) do |a, b|
    reg_op name, 0, a, opcode, b
  end
  define_singleton_method("#{name}i") do |a, b|
    throw "'a' must be a register" unless a.is_a? Register
    text = "#{name}i #{a}, #{b.inspect}"
    if b.is_a?(Symbol)
      pc_op do |pc|
        [[opcode, a.to_i, addr_for(b)>>4 & 0xF, addr_for(b) & 0xF], text]
      end
    else
      throw "'b' must be an immediate value or a label" unless b.is_a? Fixnum
      throw "'b' out of range" if b < -128 || b > 255
      op opcode, a.to_i, b>>4 & 0xF, b & 0xF, text
    end
  end
end

for name, code in arith_ops
  arith_op(name.to_s, code)
end

def define_branch(cond, code)
  define_method("j#{cond}", lambda do |dest_reg|
    throw "'dest_reg' must be a register" unless dest_reg.is_a? Register
    op 0b0100,code,0b1100,dest_reg.to_i, "j#{cond} #{dest_reg}"
  end)
  define_method("b#{cond}", lambda do |disp|
    throw "'disp' must be an immediate value or a label" unless disp.is_a?(Fixnum) || disp.is_a?(Symbol)
    throw "'disp' out of range" if !disp.is_a?(Symbol) && (disp < -128 || disp > 127)
    pc_op do |pc|
      if disp.is_a?(Symbol)
        d = addr_for(disp) - pc
        throw "'#{disp}'(0x#{d.to_hex}) is too far from 0x#{pc.to_hex}" if d < -128 || d > 127
      else
        d = disp
      end
      [[0b1100,code,d>>4 & 0xF,d & 0xF], "b#{cond} #{disp.inspect}"]
    end
  end)  
end

def define_cond_block(cond)
  define_method("#{cond}?", lambda do |&proc|
                  if_label = gen_label(cond)
                  done_label = gen_label("not_#{cond}".to_sym)
                  send("b#{cond}", if_label)
                  buc done_label
                  label if_label
                  proc.call
                  label done_label
                end)
end
               
for cond, code in conds
  define_branch(cond, code)
  define_cond_block(cond)
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
  throw "'a' must be a register" unless a.is_a? Register
  throw "'b' must be an immediate value" unless b.is_a? Fixnum
  throw "'b' out of range" if b < -16 || b > 16
  op 0b1000,a.to_i,(b < 0 ? 1 : 0),b, "lshi #{a}, #{b}"
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

# pseudo ops
def ret
  juc rs
end

def retx
  clri
  ret
end

def lea(reg, label)
  movi reg, lo(label)
  lui reg, hi(label)
end

def preserve(*regs)
  regs.each {|r| mov rs, r}
  yield
  regs.reverse.each {|r| mov r, rs}
end
alias :preserving :preserve

def movwi(reg, w)
  throw "'word' is out of range" if w >= 2**16 || w < -2**15
  movi reg, w & 0xff
  lui reg, (w >> 8) & 0xff if w > 0x7f || w < -128
end

def wait
  buc 0
end

def lstorwi(w, label)
  throw "'word' is out of range" if w >= 2**16 || w < -2**15
  lea rs, label
  movwi ps, w
  stor ps, rs
end

def lload(reg, label)
  lea reg, label
  load reg, reg
end

def lstor(reg, label)
  lea rs, label
  stor reg, rs
end

def call(label)
  lea ps, label
  jal rs, ps
end

def call_and_return_to(label, ret_label)
  lea rs, ret_label
  lea ps, label
  juc ps
end

def ceil(a, b)
  cmp a, b
  bge 2
  mov a, b
end

def ceili(a, n)
  cmpi a, n
  bge 2
  movi a, n
end

def floor(a, b)
  cmp a, b
  ble 2
  mov a, b
end

def floori(a, n)
  cmpi a, n
  ble 2
  movi a, n
end

def neg(a)
  xori a, 0xff
  addi a, 1
end

def func(name, *regs)
  rem "sub: #{name}"
  label name
  preserving(*regs) do
    yield
    label "#{name}_done".to_sym
  end
  ret
  rem "endsub: #{name}"
end

def ifunc(name, *regs)
  rem "handler: #{name}"
  label name
  preserving(*regs) do
    yield
    label "#{name}_done".to_sym
  end
  retx
  rem "endhandler: #{name}"
end  

def sbit(reg, n)
  movi rs, 1
  lshi rs, n
  _or reg, rs
end

def tbit(reg, n)
  mov ps, reg
  lshi ps, -n
  _andi ps, 1
  cmpi ps, 1
end

def jmp(label)
  lea rs, label
  juc rs
end

alias :on? :eq?
alias :off? :ne?
