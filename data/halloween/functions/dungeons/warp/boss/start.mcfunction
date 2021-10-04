scoreboard players operation warp hal.state = $FIGHTING_BOSS hal.state

bossbar add warped_boss {"text":"❖ Warped Soul Shard ❖","color":"dark_purple","bold":true}
bossbar set warped_boss color purple
bossbar set warped_boss max 1
bossbar set warped_boss players @a[tag=playing_warp]
bossbar set warped_boss visible true

execute at @e[tag=warped_boss_marker,tag=pos1,limit=1] run function halloween:dungeons/warp/boss/start_stage1
execute store result bossbar warped_boss max run attribute @e[tag=warped_boss,limit=1] minecraft:generic.max_health get
