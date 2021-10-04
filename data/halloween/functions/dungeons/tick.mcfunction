function halloween:dungeons/template/tick
function halloween:dungeons/warp/tick

function halloween:name_tags/tick

execute as @e[tag=dungeon_portal] at @s run function halloween:dungeons/check_portals
