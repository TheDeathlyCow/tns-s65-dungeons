effect give @s instant_health 1 10
effect give @s saturation 1 10
tag @s add indungeon_template
function halloween:inv_restore/save_items
advancement grant @s only halloween:template/enter_dungeon
advancement revoke @s only halloween:template/defeated_boss

tellraw @a [{"selector": "@s", "color":"dark_purple"},{"text": " has entered TEMPLATE_NAME!","color":"aqua"}]

teleport @s 0 64 0
spawnpoint @s 0 64 0
playsound minecraft:block.portal.travel master @s 0 64 0

function halloween:dungeons/template/count_players
execute if score template hal.playerCount matches 1 run function halloween:dungeons/template/portal/first_player_enter
