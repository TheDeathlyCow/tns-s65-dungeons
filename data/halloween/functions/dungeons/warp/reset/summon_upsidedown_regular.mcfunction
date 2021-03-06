function halloween:random/next_int
scoreboard players operation temp hal.rand = current hal.rand 
scoreboard players set VARIANTS hal.CONSTANTS 1
scoreboard players operation temp hal.rand %= VARIANTS hal.CONSTANTS 

execute if score temp hal.rand matches 0 run summon skeleton ~ ~ ~ {Health:24f,PersistenceRequired:1b,Tags:["warped_mob"],CustomName:'{"text":"Dinnerbone","color":"aqua"}',HandItems:[{id:"minecraft:bow",Count:1b,tag:{display:{Name:'{"text":"Warped Bow","color":"dark_purple","italic":false}'},CustomModelData:255,Enchantments:[{id:"minecraft:punch",lvl:3s}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:4,Operation:0,UUID:[I;-1741685626,659768029,-1235392158,-498864344],Slot:"mainhand"}]}},{}],HandDropChances:[0.020F,0.085F],ArmorItems:[{},{},{},{id:'minecraft:player_head',Count:1b,tag:{SkullOwner:{Id:[I;-323912291,-2140189934,-2130956565,-1392251357],Properties:{textures:[{Value:'eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTY3ODUyMmU4OWMxODcxZDkxYTQ0ZjE0OTc3YTVjMGFjMGE4YTQyZGMxNjhhOWExM2QzZTAzYzU0ZTI0ZDMwZiJ9fX0='}]}}}}],ArmorDropChances:[0.085F,0.085F,0.085F,-1000.000F],ActiveEffects:[{Id:25b,Amplifier:3b,Duration:1000000 }],Attributes:[{Name:generic.max_health,Base:24},{Name:generic.knockback_resistance,Base:1},{Name:generic.armor,Base:4}]}

scoreboard players reset VARIANTS hal.CONSTANTS
scoreboard players reset temp hal.rand 