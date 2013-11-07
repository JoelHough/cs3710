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
    stor pos_addr, pos
  end

  s.bytes.each do |b|
    movi char, b
    stor char_addr, char
    addi pos, 1
    stor pos_addr, pos
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
  cmpi r1, 50
  blt :unrolled_print_str
  pos_addr, char_addr, pos, char, tmp = regs
  lea pos_addr, :char_pos
  label :random_char
  stor char_addr, char
  addi char, 1
  # increment col
  addi pos, 1
  mov tmp, pos
  _andi tmp, 0xFF
  cmpi tmp, 70
  bne :stor_char
  # increment row, reset col
  mov tmp, pos
  lshi tmp, -8
  addi tmp, 1
  movi pos, 0
  lu pos, tmp
  cmpi tmp, 25
  bne :stor_char
  # reset to beginning
  movi pos, 0
  label :stor_char
  stor pos_addr, pos
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
