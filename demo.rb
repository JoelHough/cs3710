load 'assembler.rb'

assemble 'demo.hex' do
  label :start
  addi r0, 1
  buc :load
  assemble_at_address 15
  label :load
  load r1, r0
  buc :start
  label :string
  ds "abc"
  label :data
  dw 1000,123,6,11,9000,9001
  add r1, 2
end
