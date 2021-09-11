tellraw @a [{"text":"Reset template.","color":"light_purple"}]
scoreboard players operation template hal.state = $EMPTY hal.state

scoreboard players set template hal.1stPlyrEntr -1 
execute as @a[tag=playing_template] in minecraft:overworld run function halloween:dungeons/template/portal/exit
function halloween:dungeons/template/boss/reset

# reset chunks
function reset:template/_load