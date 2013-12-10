load 'assembler.rb'

assemble 'tank_game.hex' do
  label :ground_index, 0x1008
  label :ground_height, 0x1009

  0.upto(15).each do |i|
    buc :irq # "irq#{i}".to_sym
  end
  buc :start

  label :irq
  retx

  label :start
  lea r0, :ground_index
  lea r1, :ground_height
  movi r2, 0
  movwi r3, 240
  movwi r4, 640
  label :set_ground_height
  stor r2, r0
  stor r3, r1
  addi r2, 1
  cmp r2, r4
  bne :set_ground_height
  wait
end
