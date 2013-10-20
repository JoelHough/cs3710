load 'assembler.rb'

assemble 'demo.hex' do
  label :start
  addi r0, 1
  assemble_at_address 15
  load r1, r0
  buc :start
end
