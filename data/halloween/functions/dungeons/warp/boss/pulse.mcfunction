
playsound minecraft:entity.ender_eye.death master @a[tag=playing_warp] ~ ~ ~ 20 0.2



execute if score current warp.bossState = $STAGE1 warp.bossState positioned ~2 ~ ~ run function halloween:dungeons/warp/reset/summon_pest
execute if score current warp.bossState = $STAGE2 warp.bossState positioned ~2 ~ ~ run function halloween:dungeons/warp/reset/summon_regular
execute if score current warp.bossState = $STAGE3 warp.bossState positioned ~2 ~ ~ run function halloween:dungeons/warp/reset/summon_miniboss

execute if score current warp.bossState = $STAGE1 warp.bossState positioned ~-2 ~ ~ run function halloween:dungeons/warp/reset/summon_pest
execute if score current warp.bossState = $STAGE2 warp.bossState positioned ~-2 ~ ~ run function halloween:dungeons/warp/reset/summon_regular
execute if score current warp.bossState = $STAGE3 warp.bossState positioned ~-2 ~ ~ run function halloween:dungeons/warp/reset/summon_miniboss

execute if score current warp.bossState = $STAGE1 warp.bossState positioned ~ ~ ~2 run function halloween:dungeons/warp/reset/summon_regular
execute if score current warp.bossState = $STAGE2 warp.bossState positioned ~ ~ ~2 run function halloween:dungeons/warp/reset/summon_strong
execute if score current warp.bossState = $STAGE3 warp.bossState positioned ~ ~ ~2 run function halloween:dungeons/warp/reset/summon_strong

execute if score current warp.bossState = $STAGE1 warp.bossState positioned ~ ~ ~-2 run function halloween:dungeons/warp/reset/summon_regular
execute if score current warp.bossState = $STAGE2 warp.bossState positioned ~ ~ ~-2 run function halloween:dungeons/warp/reset/summon_strong
execute if score current warp.bossState = $STAGE3 warp.bossState positioned ~ ~ ~-2 run function halloween:dungeons/warp/reset/summon_strong
