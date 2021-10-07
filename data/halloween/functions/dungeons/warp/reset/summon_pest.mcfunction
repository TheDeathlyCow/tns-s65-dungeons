
function halloween:random/next_int
scoreboard players operation temp hal.rand = current hal.rand 
scoreboard players set PEST_VARIANTS hal.CONSTANTS 2
scoreboard players operation temp hal.rand %= PEST_VARIANTS hal.CONSTANTS 

execute if score temp hal.rand matches 0 run summon endermite ~ ~ ~ {DeathLootTable:"halloween:warp/pest",Tags:["warped_mob"],PersistenceRequired:1b} 
execute if score temp hal.rand matches 1 run summon endermite ~ ~ ~ {DeathLootTable:"halloween:warp/pest",Tags:["warped_mob"],PersistenceRequired:1b,ActiveEffects:[{Id:14b,Amplifier:0b,Duration:1000000}]}

scoreboard players reset PEST_VARIANTS hal.CONSTANTS
scoreboard players reset temp hal.rand 