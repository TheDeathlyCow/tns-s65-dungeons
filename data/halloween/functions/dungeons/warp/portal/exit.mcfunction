
gamemode survival @s
tag @s remove playing_warp
tag @s remove leave_warp

execute as @e[type=item] if predicate 
execute if entity @s[advancements={halloween:warp/defeated_boss=false}] run function halloween:inv_restore/restore_items
function halloween:inv_restore/clear_entry

effect give @s instant_health 1 10
effect give @s saturation 1 10

tellraw @s [{"text":"Returning to the Overworld...","color":"aqua"}]
teleport @s -17 66 -5
spawnpoint @s -17 66 -5
playsound minecraft:block.portal.travel master @s -17 66 -5

scoreboard players reset @s hal.confirmExit
