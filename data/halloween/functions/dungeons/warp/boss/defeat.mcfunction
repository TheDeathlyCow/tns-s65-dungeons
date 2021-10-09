scoreboard players operation warp hal.state = $BOSS_DEFEATED hal.state
scoreboard players operation current warp.bossState = $VICTORY hal.state
# tellraw @a "defeated boss."
bossbar remove minecraft:warped_boss
advancement grant @a[tag=playing_warp] only halloween:warp/defeated_boss
execute as @e[tag=warped_mob] at @s run function halloween:dungeons/warp/reset/poof

execute at @e[tag=warped_boss_marker,tag=pos3,limit=1] run playsound minecraft:block.glass.break master @a[tag=playing_warp] ~ ~ ~ 15
execute at @e[tag=warped_boss_marker,tag=pos3,limit=1] run playsound minecraft:block.soul_sand.place master @a ~ ~ ~ 10 0.1


playsound minecraft:entity.wither.death master @a[tag=playing_warp] ~ ~ ~