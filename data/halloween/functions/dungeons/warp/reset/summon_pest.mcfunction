
function halloween:random/next_int
scoreboard players operation temp hal.rand = current hal.rand 
scoreboard players set VARIANTS hal.CONSTANTS 4
scoreboard players operation temp hal.rand %= VARIANTS hal.CONSTANTS 

execute if score temp hal.rand matches 0 run summon endermite ~ ~ ~ {Tags:["warped_mob"],PersistenceRequired:1b} 
execute if score temp hal.rand matches 1 run summon endermite ~ ~ ~ {Tags:["warped_mob"],PersistenceRequired:1b,ActiveEffects:[{Id:14b,Amplifier:0b,Duration:1000000}]}
execute if score temp hal.rand matches 2 run summon endermite ~ ~ ~ {Tags:["warped_mob"],PersistenceRequired:1b,ActiveEffects:[{Id:14b,Amplifier:0b,Duration:1000000}]}
execute if score temp hal.rand matches 3 run summon endermite ~ ~ ~ {Tags:["warped_mob"],PersistenceRequired:1b,ActiveEffects:[{Id:14b,Amplifier:0b,Duration:1000000}]}

scoreboard players reset VARIANTS hal.CONSTANTS
scoreboard players reset temp hal.rand 