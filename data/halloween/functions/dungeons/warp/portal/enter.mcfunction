effect give @s instant_health 1 10
effect give @s saturation 1 10
tag @s add playing_warp
function halloween:inv_restore/save_items
advancement grant @s only halloween:warp/enter_dungeon
advancement revoke @s only halloween:warp/defeated_boss

tellraw @a [{"selector": "@s", "color":"dark_purple"},{"text": " has entered Warped Gardens!","color":"aqua"}]

teleport @s 50 130 50
spawnpoint @s 50 130 50
playsound minecraft:block.portal.travel master @s 50 130 50

function halloween:dungeons/warp/count_players
execute if score warp hal.playerCount matches 1 run function halloween:dungeons/warp/portal/first_player_enter


function reset:warp/_join_player