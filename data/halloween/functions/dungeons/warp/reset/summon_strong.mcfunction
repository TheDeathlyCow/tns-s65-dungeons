function halloween:random/next_int
scoreboard players operation temp hal.rand = current hal.rand 
scoreboard players set VARIANTS hal.CONSTANTS 2
scoreboard players operation temp hal.rand %= VARIANTS hal.CONSTANTS 

execute if score temp hal.rand matches 0 run summon skeleton ~ ~ ~ {Health:26f,PersistenceRequired:1b,Tags:["warped_mob"],CustomName:'{"text":"Warped Spirit","color":"light_purple"}',HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Enchantments:[{id:"minecraft:sharpness",lvl:2s},{id:"minecraft:fire_aspect",lvl:1s}]}},{}],HandDropChances:[-1000.000F,0.085F],ArmorItems:[{},{},{id:"minecraft:diamond_chestplate",Count:1b},{id:"minecraft:warped_wart_block",Count:1b}],ArmorDropChances:[0.085F,0.085F,-1000.000F,-1000.000F],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:1000000}],Attributes:[{Name:generic.max_health,Base:26},{Name:generic.knockback_resistance,Base:2},{Name:generic.armor,Base:8}]}
execute if score temp hal.rand matches 1 run summon skeleton ~ ~ ~ {Health:26f,PersistenceRequired:1b,Tags:["warped_mob"],CustomName:'{"text":"Warped Spirit","color":"light_purple"}',HandItems:[{id:"minecraft:bow",Count:1b,tag:{Enchantments:[{id:"minecraft:power",lvl:4s},{id:"minecraft:punch",lvl:3s},{id:"minecraft:flame",lvl:1s}]}},{}],HandDropChances:[-1000.000F,0.085F],ArmorItems:[{},{},{id:"minecraft:diamond_chestplate",Count:1b},{id:"minecraft:warped_wart_block",Count:1b}],ArmorDropChances:[0.085F,0.085F,-1000.000F,-1000.000F],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:1000000}],Attributes:[{Name:generic.max_health,Base:26},{Name:generic.knockback_resistance,Base:2},{Name:generic.armor,Base:8}]}

scoreboard players reset VARIANTS hal.CONSTANTS
scoreboard players reset temp hal.rand 