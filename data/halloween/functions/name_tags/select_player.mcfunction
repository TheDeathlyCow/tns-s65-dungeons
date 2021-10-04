execute store result score $p0 hal.throwerUUID run data get entity @s UUID[0] 
execute store result score $p1 hal.throwerUUID run data get entity @s UUID[1] 
execute store result score $p2 hal.throwerUUID run data get entity @s UUID[2] 
execute store result score $p3 hal.throwerUUID run data get entity @s UUID[3]

execute if score $p0 hal.throwerUUID = $i0 hal.throwerUUID if score $p1 hal.throwerUUID = $i1 hal.throwerUUID if score $p2 hal.throwerUUID = $i2 hal.throwerUUID if score $p3 hal.throwerUUID = $i3 hal.throwerUUID run tag @s add threw_item

scoreboard players reset $p0 hal.throwerUUID
scoreboard players reset $p1 hal.throwerUUID
scoreboard players reset $p2 hal.throwerUUID
scoreboard players reset $p3 hal.throwerUUID

scoreboard players add @s hal.namingItem 0