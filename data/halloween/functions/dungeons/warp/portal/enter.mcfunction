effect give @s instant_health 1 10
effect give @s saturation 1 10
tag @s add playing_warp
function halloween:inv_restore/save_items
advancement grant @s only halloween:warp/enter_dungeon
advancement revoke @s only halloween:warp/defeated_boss

tellraw @a [{"selector": "@s", "color":"dark_purple"},{"text": " has entered the Warped Village!","color":"aqua"}]

teleport @s ~ ~ ~
spawnpoint @s ~ ~ ~
playsound minecraft:block.portal.travel master @s ~ ~ ~


function halloween:dungeons/warp/count_players
forceload add ~-80 ~-80 ~80 ~80
execute if score warp hal.playerCount matches 1 run function halloween:dungeons/warp/portal/first_player_enter
forceload remove ~-80 ~-80 ~80 ~80

function reset:warp/_join_player