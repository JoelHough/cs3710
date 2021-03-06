load 'assembler.rb'

assemble 'cpu_test.hex' do
  label :interrupt_jump_table
  0.upto(15).each do |i|
    buc "irq#{i}".to_sym
  end

  movi r6, lo(:bad)
  def error
    juc r6
  end
  def assert(cond)
    self.send("b#{cond}", 2)
    error
  end
  def assert_not(cond)
    self.send("b#{cond}", 2)
    buc 2
    error
  end
  def cmpi_test(cond, a, b, c) # cmpi a, b == true; cmpi a, c == false
    movi r0, a
    cmpi r0, b
    assert cond
    cmpi r0, c
    assert_not cond
  end
  lea r0, :buc
  juc r0
  label :irq0
  mov ps, psr
  add r4, r3
  mov psr, ps
  retx
  label :irq1
  mov ps, psr
  add r3, r2
  mov psr, ps
  retx
  label :irq2
  addi r2, 1
  retx
  3.upto(15).each do |i|
    label "irq#{i}".to_sym
  end
  retx

  label :buc
  buc :test_start
  label :bad # the bad loop. if buc doesn't work, this won't really work
  movi r0, 0xff
  load r1, r0
  buc -1 # if pc is ever at this line, something went wrong

  label :test_start
  label :movi
  label :cmpi
  label :bcond
  cmpi_test :eq, 0, 0, 1
  cmpi_test :ne, 0, 1, 0
  cmpi_test :hi, 0, 0x80, 0
  cmpi_test :hi, 0x80, 0x81, 0
  cmpi_test :ls, 0, 0, 0x80
  cmpi_test :ls, 0x80, 0, 0x81
  cmpi_test :ls, 1, 0, 2
  cmpi_test :gt, -127, 0, -128
  cmpi_test :gt, 0, 1, 0
  cmpi_test :le, -127, -128, 0
  cmpi_test :le, 0, 0, 1
  cmpi_test :le, 1, 0, 2
  cmpi_test :lo, 0x80, 0, 0x80
  cmpi_test :hs, 0x80, 0x80, 0
  cmpi_test :lt, 1, 0, 1
  cmpi_test :lt, 0, -1, 1
  cmpi_test :ge, 0, 1, -1
  cmpi_test :ge, 1, 1, 0

  label :cmp
  movi r0, 1
  movi r1, 1
  cmp r0, r1
  assert :eq

  # at this point, all bconds except bcs, bcc, bfs, bfc are tested
  label :mov
  movi r0, 0xff
  movi r1, 0
  mov r1, r0
  cmp r1, r0
  assert :eq
  
  label :addi
  movi r0, 0
  addi r0, 1
  assert :cc
  assert :fc
  cmpi r0, 1
  assert :eq

  label :sign_extend
  movi r0, 0xff
  addi r0, 1
  assert :cs
  assert :fc
  cmpi r0, 0
  assert :eq

  label :lui
  movi r0, 0xff
  lui r0, 0
  addi r0, 1
  cmpi r0, 0
  assert :ne

  label :lu
  movi r0, 0xff
  movi r1, 0
  lu r0, r1
  addi r0, 1
  cmpi r0, 0
  assert :ne  

  label :add
  movi r0, 0
  movi r1, 1
  add r0, r1
  assert :fc
  assert :cc
  cmpi r0, 1
  assert :eq

  movi r0, 0
  lui r0, 0x80
  mov r1, r0
  add r0, r1
  assert :fs
  assert :cs

  label :sub
  movi r0, -2
  movi r1, 0xFF
  lui r1, 0x7F
  sub r0, r1
  assert :fs
  assert :cc
  cmp r0, r1
  assert :eq

  movi r0, 0
  movi r1, 0
  lui r1, 0x80
  sub r0, r1
  assert :fs
  assert :cs
  cmp r0, r1
  assert :eq

  label :subi
  movi r0, 0
  subi r0, 1
  assert :fc
  assert :cs
  cmpi r0, -1
  assert :eq

  movi r0, 1
  subi r0, 1
  assert :fc
  assert :cc
  cmpi r0, 0
  assert :eq

  label :logic
  movi r2, 0x55
  movi r1, 0x33
  mov r0, r2
  _and r0, r1
  cmpi r0, 0x11
  assert :eq

  mov r0, r2
  _or r0, r1
  cmpi r0, 0x77
  assert :eq

  mov r0, r2
  xor r0, r1
  cmpi r0, 0x66
  assert :eq

  label :lsh
  movi r0, 0x1
  movi r1, 0
  lsh r0, r1
  cmpi r0, 0x1
  assert :eq

  lshi r0, 1
  cmpi r0, 2
  assert :eq

  lshi r0, -1
  cmpi r0, 1
  assert :eq

  movi r0, 0xff
  movi r1, 0xf
  lsh r0, r1
  movi r2, 0
  lui r2, 0x80
  cmp r0, r2
  assert :eq

  lshi r0, -15
  cmpi r0, 1
  assert :eq

  label :load
  label :stor
  movi r0, 1
  lea r1, :data_mem
  5.times do
    stor r0, r1
    addi r0, 1
    addi r1, 2
  end
  movi r0, 1
  lea r1, :data_mem
  5.times do
    load r0, r1
    lshi r0, 1
    addi r1, 1
    stor r0, r1
    addi r1, 1
  end
  movi r0, 0
  lea r1, :data_mem
  5.times do |i|
    load r0, r1
    cmpi r0, i+1
    assert :eq
    addi r1, 1
    load r0, r1
    cmpi r0, (i+1) * 2
    assert :eq
    addi r1, 1
  end

  label :jcond
  movi r0, 1
  cmpi r0, 1
  jne r6
  lea r1, :jal
  jeq r1
  error

  label :jal
  movi r2, 0
  cmpi r2, 1
  lea r0, :subroutine
  jal r1, r0
  cmpi r2, 3
  assert :eq
  lea r0, :stack
  juc r0

  error
  label :subroutine
  movi r2, 3
  juc r1
  error

  label :stack
  def test_stack(stack_reg)
    movi stack_reg, 1
    movi stack_reg, 2
    movi stack_reg, 3
    add stack_reg, stack_reg
    movi r0, 0
    add r0, stack_reg
    add r0, stack_reg
    cmpi r0, 8
    assert :eq
    cmpi stack_reg, 1
    assert :eq
  end

  test_stack ps
  test_stack rs

  label :interrupts
  label :interrupt_control_register, 0x1001
  lea r0, :interrupt_control_register
  movi r2, 1
  movi r3, 2
  movi r4, 3
  movi r1, 0b0000_0111
  stor r1, r0
  nop
  nop
  cmpi r2, 2
  assert :eq
  cmpi r3, 4
  assert :eq
  cmpi r4, 7
  assert :eq

  label :psr_saving
  movi r0, 1
  cmpi r0, 1
  assert :eq
  preserving psr do
    cmpi r0, 0
    assert :ne
  end
  assert :eq

  label :timers
  label :timer0_register, 0x1004 #irq0
  label :timer1_register, 0x1005 #irq1
  # timer1 -> r3 += r2
  # timer0 -> r4 += r3
  movi r1, 0x7F
  movi r2, 10
  movi r3, 1
  movi r4, 0
  lea r0, :timer0_register
  movi r1, 3
  stor r1, r0
  lea r0, :timer1_register
  movi r1, 2
  stor r1, r0
  movi r1, 0x00 # should be long enough to catch 3ms
  lui r1, 0xB0

  label :timer_loop
  cmpi r4, 11
  beq :end_timer
  cmpi r4, 1
  assert :ne
  subi r1, 1
  cmpi r1, 0
  assert :ne
  buc :timer_loop
  label :end_timer

  lea r0, :data_mem
  movi r1, 0xEF
  lui r1, 0xBE
  stor r1, r0
  label :pass
  load r1, r0
  buc :pass

  label :data_mem
  dw 0,0,0,0,0
end
