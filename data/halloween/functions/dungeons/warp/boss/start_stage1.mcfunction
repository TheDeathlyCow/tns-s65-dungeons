scoreboard players operation current warp.bossState = $STAGE1 warp.bossState
summon slime ~ ~-0.25 ~ {DeathLootTable:"halloween:warp/boss",Glowing:1b,CustomNameVisible:0b,NoAI:1b,Health:200f,Size:0,Tags:["warped_boss","stage1"],ActiveEffects:[{Id:10b,Amplifier:2b,Duration:999999},{Id:11b,Amplifier:2b,Duration:999999},{Id:12b,Amplifier:0b,Duration:999999}],Attributes:[{Name:generic.max_health,Base:200},{Name:generic.armor,Base:15}]}
# forceload add ~ ~ 
scoreboard players set $time_since_start warp.timer 0
# tellraw @a "stage1."
