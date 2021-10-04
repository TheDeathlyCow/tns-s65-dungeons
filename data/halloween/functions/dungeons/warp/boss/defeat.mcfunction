scoreboard players operation warp hal.state = $BOSS_DEFEATED hal.state
scoreboard players operation current warp.bossState = $VICTORY hal.state
# tellraw @a "defeated boss."
bossbar remove minecraft:warped_boss
advancement grant @a[tag=playing_warp] only halloween:warp/defeated_boss
execute as @e[tag=warped_mob] at @s run function halloween:dungeons/warp/reset/poof


