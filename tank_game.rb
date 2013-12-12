load 'assembler.rb'

assemble 'tank_game.hex' do
  fps = 30
  def pps(p)
    p * 128 / 30
  end
  initial_tank1_x = 64
  initial_tank2_x = 640 - 64 + 8
  middle_button = 0
  up_button = 1
  left_button = 2
  down_button = 3
  right_button = 4
  def switch(n)
    lload ps, :switches
    tbit ps, n
  end
  def snes(n)
    lload ps, :snes
    tbit ps, n
  end

  timer0_interval = 1000 / fps
  timer1_interval = 120

  label :rand, 0x4002
  label :timer0, 0x4004
  label :timer1, 0x4005
  tank_game_base = 0x4008
  label :ground_index, tank_game_base + 0x0
  label :ground_height, tank_game_base + 0x1
  label :bullet_x, tank_game_base + 0x2
  label :bullet_y, tank_game_base + 0x3
  label :tank1_x, tank_game_base + 0x4
  label :tank1_y, tank_game_base + 0x5
  label :tank2_x, tank_game_base + 0x6
  label :tank2_y, tank_game_base + 0x7
  label :switches, 0x4020
  label :leds, 0x4021
  label :seg, 0x4022
  label :snes, 0x4023

  @game_states = %i(player1_aiming player1_firing player2_aiming player2_firing player1_wins player2_wins)

  buc :timer0_irqh
  buc :timer1_irqh
  buc :vsync_irqh
  buc :input_irqh
  4.upto(15).each do |i|
    buc :irq # "irq#{i}".to_sym
  end

  call :restart
  lstorwi timer0_interval, :timer0
  lstorwi timer1_interval, :timer1
  wait

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

  ifunc :input_irqh, r0 do
    lload r0, :snes
    lstor r0, :seg
    #call :fire
  end

  ifunc :irq do
  end

  func :restart, r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10 do
    ground_index_addr = r0
    ground_height_addr = r1
    ground_index = r2
    ground_height = r3
    tmp = r4
    rand = r5
    left_edge = r6
    tank1_x = r7
    tank2_x = r8
    hill_table_addr = r9
    hill_ground = r10
    lea hill_table_addr, :hill_table
    lea ground_index_addr, :ground_index
    lea ground_height_addr, :ground_height
    movi ground_index, 0
    movwi ground_height, 128
    movwi left_edge, 640
    movwi tank1_x, initial_tank1_x
    movwi tank2_x, initial_tank2_x
    mov tmp, tank1_x
    addi tmp, 8
    lstor tmp, :tank1_x
    mov tmp, tank2_x
    addi tmp, 8
    lstor tmp, :tank2_x
    label :set_ground_height
    mov hill_ground, ground_height
    switch 10
    on? do
      load hill_ground, hill_table_addr
      add hill_ground, ground_height
      addi hill_table_addr, 1
    end
    stor ground_index, ground_index_addr
    stor hill_ground, ground_height_addr
    addi ground_index, 1
    lload rand, :rand
    _andi rand, 3
    cmpi rand, 1
    eq? do
      addi ground_height, 1
      movwi tmp, 500
      ceil ground_height, tmp
    end
    cmpi rand, 3
    eq? do
      subi ground_height, 1
      movi tmp, 0
      floor ground_height, tmp
    end
    mov tmp, hill_ground
    addi tmp, 15
    cmp ground_index, tank1_x
    eq? do
      lstor tmp, :tank1_y
    end
    cmp ground_index, tank2_x
    eq? do
      lstor tmp, :tank2_y
    end
    cmp ground_index, left_edge
    bne :set_ground_height
    lload tmp, :game_state
    cmpi tmp, @game_states.index(:player1_wins)
    eq? do
      lstorwi @game_states.index(:player2_aiming), :game_state
    end
    cmpi tmp, @game_states.index(:player2_wins)
    eq? do
      lstorwi @game_states.index(:player1_aiming), :game_state
    end
  end

  func :handle_input, r0, r1, r2, r3 do
    switches = r0
    state = r1
    angle = r2
    power = r3
    lload switches, :switches
    lload state, :game_state
    tbit switches, 9
    on? do
      call :restart
    end

    cmpi state, @game_states.index(:player1_aiming)
    eq? do
      lload angle, :tank1_angle
      lload power, :tank1_power
      tbit switches, up_button
      on? do
        addi angle, 1
        ceili angle, 63
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
        ceili power, 63
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

    cmpi state, @game_states.index(:player2_aiming)
    eq? do
      lload angle, :tank2_angle
      lload power, :tank2_power
      tbit switches, up_button
      on? do
        addi angle, 1
        ceili angle, 63
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
        ceili power, 63
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
    lload c, :tank1_x
    sub c, bx
    cmpi c, 16
    hi? do
      lload c, :tank1_y
      sub c, by
      cmpi c, 16
      hi? do
        movi ps, 1
        movi ps, 1
        buc :handle_collision_done
      end
    end

    lload c, :tank2_x
    sub c, bx
    cmpi c, 16
    hi? do
      lload c, :tank2_y
      sub c, by
      cmpi c, 16
      hi? do
        movi ps, 2
        movi ps, 1
        buc :handle_collision_done
      end
    end

    movi ps, 0
  end

  func :bullet_explode do
  end

  func :ground_explode,r0,r1,r2,r3,r4,r5,r6 do
    x = r0
    tab_addr = r1
    bottom = r2
    y = r3
    r = r4
    ground_height = r5
    cut = r6
    lea tab_addr, :explosion_table
    lload x, :bullet_x
    lload y, :bullet_y
    subi x, 7
    
    16.times do
      load r, tab_addr
      mov bottom, y
      sub bottom, r
      lstor x, :ground_index
      lload ground_height, :ground_height
      mov cut, ground_height
      sub cut, bottom
      floori cut, 0
      add r, r
      ceil cut, r
      sub ground_height, cut
      floori ground_height, 0
      lstor ground_height, :ground_height
      addi tab_addr, 1
      addi x, 1
    end
    # lower_cut = bx - circle_bottom
    # cut = ground_height - lower_cut
    # floor cut 0
    # ceil cut upper cut
  end
  
  func :tank1_explode do
    lload ps, :tank1_y
    sbit ps, 15
    lstor ps, :tank1_y
  end

  func :tank2_explode do
    lload ps, :tank2_y
    sbit ps, 15
    lstor ps, :tank2_y
  end

  func :random_shot, r0 do # -- power angle
    lload ps, :rand
    _andi ps, 63
    lload r0, :rand
    _andi r0, 63
    floori r0, 12
    mov ps, r0
  end

  func :deltas, r0 do # power angle -- dy dx
    tmp = r0
    lea tmp, :d_table
    lshi ps, 7 # * 64
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
    cmpi tmp, @game_states.index(:player1_aiming)
    eq? do
      switch 15
      on? do
        call :random_shot
        lstor ps, :tank1_power
        lstor ps, :tank1_angle
      end
      lload tmp, :tank1_x
      subi tmp, 2
      lstor tmp, :bullet_x
      lload tmp, :tank1_y
      addi tmp, 1
      lstor tmp, :bullet_y
      lload ps, :tank1_angle
      lload ps, :tank1_power
      call :deltas
      lstor ps, :bullet_dy
      lstor ps, :bullet_dx
      lstorwi @game_states.index(:player1_firing), :game_state
      buc :fire_done
    end
    cmpi tmp, @game_states.index(:player2_aiming)
    eq? do
      switch 8
      on? do
        call :random_shot
        lstor ps, :tank2_power
        lstor ps, :tank2_angle
      end
      lload tmp, :tank2_x
      subi tmp, 14
      lstor tmp, :bullet_x
      lload tmp, :tank2_y
      addi tmp, 1
      lstor tmp, :bullet_y
      lload ps, :tank2_angle
      lload ps, :tank2_power
      call :deltas
      lstor ps, :bullet_dy
      neg ps
      lstor ps, :bullet_dx
      lstorwi @game_states.index(:player2_firing), :game_state
      buc :fire_done
    end
  end

  def firing_func(tank, next_state)
    func "#{tank}_firing".to_sym, r0 do
      lload ps, "#{tank}_angle".to_sym
      lload ps, "#{tank}_power".to_sym
      call :disp_shot
      call :update_bullet # -- out_of_bounds?
      cmpi ps, 0
      ne? do
        lstorwi @game_states.index(next_state), :game_state
        buc "#{tank}_firing_done".to_sym
      end
      call :handle_collision # -- 0 | 1, collided_with (0: ground, 1: tank1, 2: tank2)
      cmpi ps, 0
      ne? do
        mov r0, ps
        call :bullet_explode
        cmpi r0, 0
        eq? {call :ground_explode}
        cmpi r0, 1
        eq? do
          call :tank1_explode
          lstorwi @game_states.index(:player2_wins), :game_state
          call :reset_bullet
          buc "#{tank}_firing_done".to_sym
        end
        cmpi r0, 2
        eq? do
          call :tank2_explode
          lstorwi @game_states.index(:player1_wins), :game_state
          call :reset_bullet
          buc "#{tank}_firing_done".to_sym
        end
        lstorwi @game_states.index(next_state), :game_state
        call :reset_bullet
      end
    end
  end

  firing_func(:tank1, :player2_aiming)
  firing_func(:tank2, :player1_aiming)

  func :game_loop, r0, r1 do
    state = r0
    lload state, :game_state

    cmpi state, @game_states.index(:player1_aiming)
    eq? do
      lstorwi 128, :leds
      switch 15
      on? {call :fire}
      buc :game_loop_done
    end

    cmpi state, @game_states.index(:player2_aiming)
    eq? do
      lstorwi 1, :leds
      switch 8
      on? {call :fire}
      buc :game_loop_done
    end

    cmpi state, @game_states.index(:player1_firing)
    eq? do
      call_and_return_to :tank1_firing, :game_loop_done
    end

    cmpi state, @game_states.index(:player2_firing)
    eq? do
      call_and_return_to :tank2_firing, :game_loop_done
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
  0.upto(63) do |power|
    0.upto(63) do |angle|
      dw (Math.cos((Math::PI * angle) / (2 * 63)) * power * 8).to_i, (Math.sin((Math::PI * angle) / (2 * 63)) * power * 8).to_i
    end
  end
  label :disp_table
  0.upto(63) do |disp|
    dw (disp * 99 / 63.0).to_s.to_i(16)
  end
  label :explosion_table
  0.upto(15) do |x|
    dw (Math.sin((Math::PI * x) / 15) * 8).to_i
  end
  label :hill_table
  0.upto(639) do |x|
    dw (Math.sin(Math::PI * (x - 70) / 500) * 150).to_i
  end
  nop
end
