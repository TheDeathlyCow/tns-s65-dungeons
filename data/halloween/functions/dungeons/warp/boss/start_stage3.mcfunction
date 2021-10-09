scoreboard players operation current warp.bossState = $STAGE3 warp.bossState
summon slime ~ ~-0.25 ~ {DeathLootTable:"halloween:warp/boss",Glowing:1b,CustomNameVisible:0b,NoAI:1b,Health:350f,Size:0,Tags:["warped_boss","stage3"],ArmorItems:[{},{},{id:"minecraft:netherite_chestplate",Count:1b,tag:{Enchantments:[{id:"minecraft:projectile_protection",lvl:10s}]}},{}],ArmorDropChances:[0.085F,0.085F,-1000.000F,0.085F],ActiveEffects:[{Id:10b,Amplifier:0b,Duration:999999},{Id:11b,Amplifier:1b,Duration:999999},{Id:12b,Amplifier:0b,Duration:999999}],Attributes:[{Name:generic.max_health,Base:350},{Name:generic.armor,Base:10}]}

scoreboard players set $TIME_BETWEEN_SUMMONS warp.timer 600
scoreboard players set $time_since_start warp.timer 0
execute store result bossbar warped_boss max run attribute @e[tag=warped_boss,limit=1] minecraft:generic.max_health get
# tellraw @a "stage3."

# scoreboard objectives add debugtemp dummy
# scoreboard objectives setdisplay sidebar debugtemp
# execute store result score x debugtemp run data get entity @s Pos[0]
# execute store result score y debugtemp run data get entity @s Pos[1]
# execute store result score z debugtemp run data get entity @s Pos[2]

execute at @e[tag=warped_boss_marker,tag=pos2,limit=1] run playsound minecraft:block.glass.break master @a[tag=playing_warp] ~ ~ ~ 15
execute at @e[tag=warped_boss_marker,tag=pos2,limit=1] run playsound minecraft:block.soul_sand.place master @a ~ ~ ~ 10 0.1

playsound minecraft:entity.wither.spawn master @a[tag=playing_warp] ~ ~ ~ 30 