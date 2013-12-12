load 'assembler.rb'

assemble 'tank_game.hex' do
  timer0_interval = 33
  timer1_interval = 3000

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

  label :timer0_irqh
  call :game_loop
  preserving r0,r1,r2 do
    lload r1, :switches
    movi r0, 1
    _and r0, r1
    cmpi r0, 0
    ne? do
      lload r2, :bullet_ddy
      addi r2, 1
      lstor r2, :bullet_ddy
      lstor r2, :seg
    end
    movi r0, 2
    _and r0, r1
    cmpi r0, 0
    ne? do
      lload r2, :bullet_ddy
      subi r2, 1
      lstor r2, :bullet_ddy
      lstor r2, :seg
    end
  end
  lstorwi timer0_interval, :timer0
  retx

  label :vsync_irqh
  retx

  label :timer1_irqh
  lstorwi timer1_interval, :timer1
  label :input_irqh
  call :fire
  retx

  label :irq
  retx

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

  label :update_bullet do
    preserving r0,r1 do
      movi ps, 0
      lload r0, :bullet_fine_x
      lload r1, :bullet_dx
      add r0, r1
      rem "x out of bounds check"
      cmpi r0, 0
      bgt :bullet_out_of_bounds
      movwi r1, 640 << 5
      cmp r0, r1
      ble :bullet_out_of_bounds
      rem "save new x position"
      lstor r0, :bullet_fine_x
      lshi r0, -5
      lstor r0, :bullet_x

      lload r0, :bullet_fine_y
      lload r1, :bullet_dy
      add r0, r1
      rem "floor y and fine_y"
      cmpi r0, 0
      blt :cap_bullet_y
      movi r0, 0
      lstor r0, :bullet_fine_y
      lstor r0, :bullet_y
      buc :update_bullet_accel
      label :cap_bullet_y
      rem "ceil y"
      lstor r0, :bullet_fine_y
      lshi r0, -5
      movwi r1, 479
      ceil r0, r1
      lstor r0, :bullet_y
      buc :update_bullet_accel

      label :update_bullet_accel
      lload r0, :bullet_dy
      lload r1, :bullet_ddy
      add r0, r1
      lstor r0, :bullet_dy
      buc :update_bullet_done

      label :bullet_out_of_bounds
      movwi r0, 0
      lstor r0, :bullet_dx
      lstor r0, :bullet_fine_x
      lstor r0, :bullet_x
      lstor r0, :bullet_dy
      lstor r0, :bullet_fine_y
      lstor r0, :bullet_y
      mov r0, ps
      movi ps, 1

      label :update_bullet_done
    end
    ret
  end

  label :handle_collision do # -- 0 | 1, collided_with (0: ground, 1: tank1, 2: tank2)
    preserving r0, r1 do
      lload r0, :bullet_x
      lstor r0, :ground_index
      lload r1, :ground_height
      cmp r0, r1
      gt? do
        movi ps, 0
        movi ps, 1
        buc :handle_collision_done
      end
      movi ps, 0
      label :handle_collision_done
    end
    ret
  end

  label :bullet_explode do
    ret
  end

  label :ground_explode do
    ret
  end
  
  label :tank1_explode do
    ret
  end

  label :tank2_explode do
    ret
  end

  label :fire do
    preserving r0 do
      lload r0, :game_state
      cmpi r0, game_states.index(:player1_aiming)
      eq? do
        lstorwi 64 << 5, :bullet_fine_x
        lstorwi 138 << 5, :bullet_fine_y
        lstorwi 100, :bullet_dx
        lstorwi 100, :bullet_dy
        lstorwi game_states.index(:player1_firing), :game_state
        buc :fire_done
      end
      cmpi r0, game_states.index(:player2_aiming)
      eq? do
        lstorwi (640 - 64) << 5, :bullet_fine_x
        lstorwi 138 << 5, :bullet_fine_y
        lstorwi -100, :bullet_dx
        lstorwi 100, :bullet_dy
        lstorwi game_states.index(:player2_firing), :game_state
        buc :fire_done
      end
      label :fire_done
    end
    ret
  end

  label :game_loop do
    preserving r0,r1 do
      lload r0, :game_state
      lea r1, :game_state_jump_table
      add r1, r0
      juc r1
      label :game_state_jump_table
      game_states.each {|state| buc state}

      label :player1_aiming
      label :player2_aiming
      buc :game_loop_done

      label :player1_firing do
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
          buc :game_loop_done
        end
      end

      label :player2_firing do
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
          buc :game_loop_done
        end
      end
      
      buc :game_loop_done
      
      label :game_loop_done
    end
    ret
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
  label :bullet_fine_x
  dw 0
  label :bullet_fine_y
  dw 0
  label :bullet_ddy
  dw -50
end
