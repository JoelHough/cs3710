load 'assembler.rb'

assemble 'tank_game.hex' do
  fps = 30
  def pps(p)
    p * 128 / 30
  end
  middle_button = 0
  up_button = 1
  left_button = 2
  down_button = 3
  right_button = 4
  def switch(n)
    lload ps, :switches
    tbit ps, n
  end
  timer0_interval = 1000 / fps
  timer1_interval = 200

  label :rand, 0x1002
  label :timer0, 0x1004
  label :timer1, 0x1005
  tank_game_base = 0x1008
  label :ground_index, tank_game_base + 0x0
  label :ground_height, tank_game_base + 0x1
  label :bullet_x, tank_game_base + 0x2
  label :bullet_y, tank_game_base + 0x3
  label :switches, 0x1020
  label :leds, 0x1021
  label :seg, 0x1022

  game_states = %i(player1_aiming player1_firing player2_aiming player2_firing)

  buc :timer0_irqh
  buc :timer1_irqh
  buc :vsync_irqh
  buc :input_irqh
  4.upto(15).each do |i|
    buc :irq # "irq#{i}".to_sym
  end
  buc :start

  ifunc :timer0_irqh, r0,r1,r2 do
    call :game_loop
    lstorwi timer0_interval, :timer0
  end

  ifunc :vsync_irqh do
  end

  ifunc :timer1_irqh do
    call :handle_input
    lstorwi timer1_interval, :timer1
  end

  ifunc :input_irqh do
    call :fire
  end

  ifunc :irq do
  end

  label :start
  lea r0, :ground_index
  lea r1, :ground_height
  movi r2, 0
  movwi r3, 128
  movwi r4, 640
  label :set_ground_height
  stor r2, r0
  stor r3, r1
  addi r2, 1
  lload r5, :rand
  _andi r5, 3
  cmpi r5, 1
  eq? do
    addi r3, 1
    movwi r5, 639
    ceil r3, r5
  end
  cmpi r5, 3
  eq? do
    subi r3, 1
    movi r5, 0
    floor r3, r5
  end
  cmp r2, r4
  bne :set_ground_height
  lstorwi timer0_interval, :timer0
  lstorwi timer1_interval, :timer1
  wait

  func :handle_input, r0, r1, r2, r3 do
    switches = r0
    state = r1
    angle = r2
    power = r3
    lload switches, :switches
    lload state, :game_state
    
    cmpi state, game_states.index(:player1_aiming)
    eq? do
      lload angle, :tank1_angle
      lload power, :tank1_power
      tbit switches, up_button
      on? do
        addi angle, 1
        ceili angle, 31
        lstor angle, :tank1_angle
      end
      tbit switches, down_button
      on? do
        subi angle, 1
        floori angle, 0
        lstor angle, :tank1_angle
      end
      tbit switches, left_button
      on? do
        subi power, 1
        floori power, 0
        lstor power, :tank1_power
      end
      tbit switches, right_button
      on? do
        addi power, 1
        ceili power, 31
        lstor power, :tank1_power
      end
      tbit switches, middle_button
      on? do
        call :fire
      end
      mov ps, angle
      mov ps, power
      call :disp_shot
      buc :handle_input_done
    end

    cmpi state, game_states.index(:player2_aiming)
    eq? do
      lload angle, :tank2_angle
      lload power, :tank2_power
      tbit switches, up_button
      on? do
        addi angle, 1
        ceili angle, 31
        lstor angle, :tank2_angle
      end
      tbit switches, down_button
      on? do
        subi angle, 1
        floori angle, 0
        lstor angle, :tank2_angle
      end
      tbit switches, left_button
      on? do
        addi power, 1
        ceili power, 31
        lstor power, :tank2_power
      end
      tbit switches, right_button
      on? do
        subi power, 1
        floori power, 0
        lstor power, :tank2_power
      end
      tbit switches, middle_button
      on? do
        call :fire
      end
      mov ps, angle
      mov ps, power
      call :disp_shot
      buc :handle_input_done
    end
  end

  func :update_bullet, r0,r1,r2,r3 do
    frac = r0
    d = r1
    tmp = r2
    full = r3
    movi ps, 0
    lload full, :bullet_x
    lload frac, :bullet_frac_x
    lload d, :bullet_dx
    add frac, d
    mov tmp, frac
    cmpi frac, 127
    lt? do
      _andi frac, 127
      lshi tmp, -7
      add full, tmp
      buc :bullet_out_of_bounds_check
    end
    cmpi frac, -127
    gt? do
      neg frac
      _andi frac, 127
      neg frac
      neg tmp
      lshi tmp, -7
      sub full, tmp
    end
    label :bullet_out_of_bounds_check
    lstor frac, :bullet_frac_x
    cmpi full, 0
    bgt :bullet_out_of_bounds
    movwi tmp, 640
    cmp full, tmp
    ble :bullet_out_of_bounds
    lstor full, :bullet_x
    
    lload full, :bullet_y
    lload frac, :bullet_frac_y
    lload d, :bullet_dy
    add frac, d
    mov tmp, frac
    cmpi frac, 127
    lt? do
      _andi frac, 127
      lshi tmp, -7
      add full, tmp
      buc :floor_bullet_y
    end
    cmpi frac, -127
    gt? do
      neg frac
      _andi frac, 127
      neg frac
      neg tmp
      lshi tmp, -7
      sub full, tmp
    end
    
    label :floor_bullet_y
    lstor frac, :bullet_frac_y
    cmpi full, 0
    blt :cap_bullet_y
    movi full, 0
    lstor full, :bullet_frac_y
    lstor full, :bullet_y
    buc :update_bullet_accel
    label :cap_bullet_y
    rem "ceil y"
    movwi tmp, 479
    ceil full, tmp
    lstor full, :bullet_y
    buc :update_bullet_accel
    
    label :update_bullet_accel
    lload tmp, :bullet_ddy
    add d, tmp
    lstor d, :bullet_dy
    buc :update_bullet_done
    
    label :bullet_out_of_bounds
    call :reset_bullet
    mov tmp, ps
    movi ps, 1
  end

  func :reset_bullet, r0 do
    tmp = r0
    movwi tmp, 0
    lstor tmp, :bullet_dx
    lstor tmp, :bullet_frac_x
    lstor tmp, :bullet_x
    lstor tmp, :bullet_dy
    lstor tmp, :bullet_frac_y
    lstor tmp, :bullet_y
  end

  func :handle_collision, r0, r1, r2 do # -- 0 | 1, collided_with (0: ground, 1: tank1, 2: tank2)
    bx = r0
    by = r1
    c = r2
    lload bx, :bullet_x
    lload by, :bullet_y
    lstor bx, :ground_index
    lload c, :ground_height
    cmp by, c
    gt? do
      movi ps, 0
      movi ps, 1
      buc :handle_collision_done
    end
    #lload c, :tank1_x
    #cmp bx, c
    
    movi ps, 0
  end

  func :bullet_explode do
  end

  func :ground_explode do
  end
  
  func :tank1_explode do
  end

  func :tank2_explode do
  end

  func :random_shot do # -- power angle
    lload ps, :rand
    _andi ps, 31
    lload ps, :rand
    _andi ps, 31
  end

  func :deltas, r0 do # power angle -- dy dx
    tmp = r0
    lea tmp, :d_table
    lshi ps, 6
    add tmp, ps
    lshi ps, 1
    add tmp, ps
    load ps, tmp
    addi tmp, 1
    load ps, tmp
  end

  func :disp_shot, r0, r1 do # power angle --
    base = r0
    seg = r1
    lea base, :disp_table
    add ps, base
    load seg, ps
    add ps, base
    load ps, ps
    lu seg, ps
    lstor seg, :seg
  end

  func :fire, r0 do
    tmp = r0
    lload tmp, :game_state
    cmpi tmp, game_states.index(:player1_aiming)
    eq? do
      switch 15
      on? do
        call :random_shot
        lstor ps, :tank1_power
        lstor ps, :tank1_angle
      end
      lstorwi 64, :bullet_x
      lstorwi 180, :bullet_y
      lload ps, :tank1_angle
      lload ps, :tank1_power
      call :deltas
      lstor ps, :bullet_dy
      lstor ps, :bullet_dx
      lstorwi game_states.index(:player1_firing), :game_state
      buc :fire_done
    end
    cmpi tmp, game_states.index(:player2_aiming)
    eq? do
      switch 8
      on? do
        call :random_shot
        lstor ps, :tank2_power
        lstor ps, :tank2_angle
      end
      lstorwi (640 - 64), :bullet_x
      lstorwi 180, :bullet_y
      lload ps, :tank2_angle
      lload ps, :tank2_power
      call :deltas
      lstor ps, :bullet_dy
      neg ps
      lstor ps, :bullet_dx
      lstorwi game_states.index(:player2_firing), :game_state
      buc :fire_done
    end
  end

  func :game_loop, r0, r1 do
    state = r0
    lload state, :game_state

    cmpi state, game_states.index(:player1_aiming)
    eq? do
      lstorwi 128, :leds
      switch 15
      on? {call :fire}
      buc :game_loop_done
    end

    cmpi state, game_states.index(:player2_aiming)
    eq? do
      lstorwi 1, :leds
      switch 8
      on? {call :fire}
      buc :game_loop_done
    end

    cmpi state, game_states.index(:player1_firing)
    eq? do
      lload ps, :tank1_angle
      lload ps, :tank1_power
      call :disp_shot
      call :update_bullet # -- out_of_bounds?
      cmpi ps, 0
      ne? do
        lstorwi game_states.index(:player2_aiming), :game_state
        buc :game_loop_done
      end
      call :handle_collision # -- 0 | 1, collided_with (0: ground, 1: tank1, 2: tank2)
      cmpi ps, 0
      ne? do
        mov r0, ps
        call :bullet_explode
        cmpi r0, 0
        eq? {call :ground_explode}
        cmpi r0, 1
        eq? {call :tank1_explode}
        #cmpi r0, 2
        #eq? {call :tank2_explode}
        lstorwi game_states.index(:player2_aiming), :game_state
        call :reset_bullet
      end
      buc :game_loop_done
    end

    cmpi state, game_states.index(:player2_firing)
    eq? do
      lload ps, :tank2_angle
      lload ps, :tank2_power
      call :disp_shot
      call :update_bullet # -- out_of_bounds?
      cmpi ps, 0
      ne? do
        lstorwi game_states.index(:player1_aiming), :game_state
        buc :game_loop_done
      end
      call :handle_collision # -- 0 | 1, collided_with (0: ground, 1: tank1, 2: tank2)
      cmpi ps, 0
      ne? do
        mov r0, ps
        call :bullet_explode
        cmpi r0, 0
        eq? {call :ground_explode}
        #cmpi r0, 1
        #eq? {call :tank1_explode}
        cmpi r0, 2
        eq? {call :tank2_explode}
        lstorwi game_states.index(:player1_aiming), :game_state
        call :reset_bullet
      end
      buc :game_loop_done
    end
  end

  label :data_mem
  label :g
  dw -1
  label :game_state
  dw 0
  label :bullet_dx
  dw 0
  label :bullet_dy
  dw 0
  label :bullet_frac_x
  dw 0
  label :bullet_frac_y
  dw 0
  label :bullet_ddy
  dw -2
  label :tank1_angle
  dw 15
  label :tank1_power
  dw 15
  label :tank2_angle
  dw 15
  label :tank2_power
  dw 15
  label :d_table
  0.upto(31) do |power|
    0.upto(31) do |angle|
      dw (Math.cos((Math::PI * angle) / (2 * 31)) * power * 16).to_i, (Math.sin((Math::PI * angle) / (2 * 31)) * power * 16).to_i
    end
  end
  label :disp_table
  0.upto(31) do |disp|
    dw (disp * 99 / 31.0).to_s.to_i(16)
  end
  nop
end
