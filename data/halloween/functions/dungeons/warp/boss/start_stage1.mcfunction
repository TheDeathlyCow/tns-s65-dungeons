scoreboard players operation current warp.bossState = $STAGE1 warp.bossState
summon slime ~ ~-0.25 ~ {DeathLootTable:"halloween:warp/boss",Glowing:1b,CustomNameVisible:0b,NoAI:1b,Health:200f,Size:0,Tags:["warped_boss","stage1"],ActiveEffects:[{Id:10b,Amplifier:0b,Duration:999999},{Id:11b,Amplifier:1b,Duration:999999},{Id:12b,Amplifier:0b,Duration:999999}],Attributes:[{Name:generic.max_health,Base:200},{Name:generic.armor,Base:10}]}
# forceload add ~ ~ 
scoreboard players set $TIME_BETWEEN_SUMMONS warp.timer 200
scoreboard players set $time_since_start warp.timer 0
execute store result bossbar warped_boss max run attribute @e[tag=warped_boss,limit=1] minecraft:generic.max_health get

# tellraw @a "stage1."
playsound minecraft:entity.wither.spawn master @a[tag=playing_warp] ~ ~ ~ 30