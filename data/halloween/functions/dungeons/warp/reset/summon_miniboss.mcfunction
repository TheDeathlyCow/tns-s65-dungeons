function halloween:random/next_int
scoreboard players operation temp hal.rand = current hal.rand 
scoreboard players set VARIANTS hal.CONSTANTS 1
scoreboard players operation temp hal.rand %= VARIANTS hal.CONSTANTS 

execute if score temp hal.rand matches 0 run summon wither_skeleton ~ ~ ~ {CustomNameVisible:1b,PersistenceRequired:1b,Health:40f,Tags:["warped_mob"],CustomName:'{"text":"⸸ Warped Warden ⸸","color":"dark_red","bold":true}',HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{display:{Name:'{"text":"Warped Sword","italic":false,"color":"dark_purple"}'},CustomModelData:255,Enchantments:[{id:"minecraft:sharpness",lvl:4s},{id:"minecraft:fire_aspect",lvl:2s},{id:"minecraft:sweeping",lvl:3s}]}},{}],HandDropChances:[-1000.000F,0.085F],ArmorItems:[{},{},{id:"minecraft:netherite_chestplate",Count:1b,tag:{Enchantments:[{id:"minecraft:protection",lvl:3s},{id:"minecraft:projectile_protection",lvl:10s}]}},{id:"minecraft:sculk_sensor",Count:1b,tag:{SkullOwner:{Id:[I;-1360122082,-882032351,-1815597327,508331703],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTZhYWVmNjdjMTQzNjQ2NWQ2MmE0Y2NiNzZhODcxNmU1OGE5YmY3ZDZkZjdlY2U3N2RhZThmOGMzMDZlYzNkMiJ9fX0="}]}}}}],ArmorDropChances:[-1000.000F,-1000.000F,-1000.000F,-1000.000F],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:1000000}],Attributes:[{Name:generic.max_health,Base:40},{Name:generic.knockback_resistance,Base:1},{Name:generic.armor,Base:12},{Name:generic.armour_toughness,Base:10}]}

scoreboard players reset VARIANTS hal.CONSTANTS
scoreboard players reset temp hal.rand 

