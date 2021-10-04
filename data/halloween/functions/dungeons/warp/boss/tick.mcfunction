
execute if score warp hal.state = $PLAYERS_IN_DUNGEON hal.state if score current warp.bossState = $IDLE warp.bossState run function halloween:dungeons/warp/boss/idle_tick
execute if score warp hal.state = $FIGHTING_BOSS hal.state unless score current warp.bossState = $IDLE warp.bossState run function halloween:dungeons/warp/boss/infight_tick