
tag @s remove indungeon_template

execute as @e[type=item] if predicate 
execute if entity @s[advancements={halloween:template/defeated_boss=false}] run function halloween:inv_restore/restore_items
function halloween:inv_restore/clear_entry

effect give @s instant_health 1 10
effect give @s saturation 1 10

tellraw @s [{"text":"Returning to the Overworld...","color":"aqua"}]
teleport @s 0 64 0
spawnpoint @s 0 64 0
playsound minecraft:block.portal.travel master @s 0 64 0

scoreboard players reset @s hal.confirmExit