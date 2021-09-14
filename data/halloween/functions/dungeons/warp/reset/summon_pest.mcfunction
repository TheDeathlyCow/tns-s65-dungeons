
function halloween:random/next_int
scoreboard players operation temp hal.rand = current hal.rand 
scoreboard players set PEST_TYPE hal.CONSTANTS 2
scoreboard players operation temp hal.rand %= PEST_TYPE hal.CONSTANTS 

execute if score temp hal.rand matches 0 run summon endermite ~ ~ ~ {Tags:["warped_mob"]} 
execute if score temp hal.rand matches 1 run summon endermite ~ ~ ~ {Tags:["warped_mob"],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:1000000}]}

scoreboard players reset PEST_TYPE hal.CONSTANTS
scoreboard players reset temp hal.rand 