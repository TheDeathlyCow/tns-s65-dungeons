
execute if score current warp.bossState = $STAGE3 warp.bossState as @e[tag=warped_boss_marker,tag=pos3,limit=1] at @s run function halloween:dungeons/warp/boss/defeat
execute if score current warp.bossState = $STAGE2 warp.bossState as @e[tag=warped_boss_marker,tag=pos3,limit=1] at @s run function halloween:dungeons/warp/boss/start_stage3
execute if score current warp.bossState = $STAGE1 warp.bossState as @e[tag=warped_boss_marker,tag=pos2,limit=1] at @s run function halloween:dungeons/warp/boss/start_stage2

