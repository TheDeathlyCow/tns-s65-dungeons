# as item to be renamed, at the rename block aligned xyz

execute store result score $i0 hal.throwerUUID run data get entity @s Thrower[0] 
execute store result score $i1 hal.throwerUUID run data get entity @s Thrower[1] 
execute store result score $i2 hal.throwerUUID run data get entity @s Thrower[2] 
execute store result score $i3 hal.throwerUUID run data get entity @s Thrower[3]

execute as @a[distance=..10] run function halloween:name_tags/select_player
scoreboard players reset @a[tag=!threw_item,scores={hal.namingItem=0}] hal.namingItem
execute as @p[tag=threw_item,scores={hal.namingItem=0}] run function halloween:name_tags/prompt_player

scoreboard players reset $i0 hal.throwerUUID
scoreboard players reset $i1 hal.throwerUUID
scoreboard players reset $i2 hal.throwerUUID
scoreboard players reset $i3 hal.throwerUUID
