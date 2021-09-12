tellraw @a [{"text":"Reset warp.","color":"light_purple"}]
scoreboard players operation warp hal.state = $EMPTY hal.state

scoreboard players set warp hal.1stPlyrEntr -1 
execute as @a[tag=playing_warp] in minecraft:overworld run function halloween:dungeons/warp/portal/exit
function halloween:dungeons/warp/boss/reset

# reset chunks
function reset:warp/_load