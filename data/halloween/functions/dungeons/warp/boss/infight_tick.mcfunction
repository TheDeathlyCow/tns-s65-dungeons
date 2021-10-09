
execute store result bossbar warped_boss value run data get entity @e[tag=warped_boss,limit=1] Health
# execute unless entity @e[tag=warped_boss] run tellraw @a "no boss is up"
# execute if entity @e[tag=warped_boss_marker] run tellraw @a "there is a marker"
execute if entity @e[tag=warped_boss_marker] unless entity @e[tag=warped_boss] run function halloween:dungeons/warp/boss/increment_stage
scoreboard players add $time_since_start warp.timer 1
scoreboard players operation $time_since_start warp.timer %= $TIME_BETWEEN_SUMMONS warp.timer
execute if score $time_since_start warp.timer matches 0 as @a[tag=playing_warp] at @e[tag=warped_boss,limit=1] run function halloween:dungeons/warp/boss/pulse