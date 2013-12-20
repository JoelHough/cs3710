load 'assembler.rb'

def unrolled_print_str(s, coords={})
  rem "unrolled print '#{s}'" + (coords.empty? ? '' : " @ row:#{coords[:row]}, col:#{coords[:col]}")
  pos_addr, char_addr, pos, char = regs[r7..r15]
  lea pos_addr, :char_pos
  lea char_addr, :char_wr
  if coords.empty?
    load pos, pos_addr
  else
    movi pos, coords[:row]
    lui pos, coords[:col]
    stor pos, pos_addr
  end

  s.bytes.each do |b|
    movi char, b
    stor char, char_addr
    addi pos, 1
    stor pos, pos_addr
  end
  rem "end print"
end

def print_reg(reg)
end

assemble 'demo.hex' do
  label :char_pos, 0x400
  label :char_wr, 0x401

  label :start
  addi r0, 1
  add r1, r0
  cmpi r1, 3
  bgt :unrolled_print_str
  pos_addr, char_addr, pos, char, tmp = regs[r2..r15]
  lea char_addr, :char_wr
  lea pos_addr, :char_pos
  movi char, 32
  label :random_char
  stor char, char_addr
  addi char, 1
  rem 'increment col'
  addi pos, 1
  mov tmp, pos
  _andi tmp, 0x7F
  cmpi tmp, 70
  bne :stor_char
  rem 'increment row, reset col'
  mov tmp, pos
  lshi tmp, -8
  addi tmp, 1
  movi pos, 0
  lu pos, tmp
  cmpi tmp, 25
  bne :stor_char
  rem 'reset to beginning'
  movi pos, 0
  label :stor_char
  stor pos, pos_addr
  buc :random_char

  assemble_at_address 0x100
  label :data
  dw 1000,123,6,11,9000,9001

  assemble_at_address 0x50
  label :unrolled_print_str
  unrolled_print_str "hallo!", row:10, col:10
  lea r3, :start
  juc r3
end
