tellraw @a [{"text":"[!!] ","color":"dark_purple","bold":true},{"text":"Commencing reset of the Warped Village!","color":"light_purple","bold":false},{"text":" [!!]"}]
scoreboard players operation warp hal.state = $EMPTY hal.state

scoreboard players set warp hal.1stPlyrEntr -1 
execute as @a[tag=playing_warp] in minecraft:overworld run function halloween:dungeons/warp/portal/exit
function halloween:dungeons/warp/boss/reset

execute as @e[tag=warped_mob] at @s run function halloween:dungeons/warp/reset/poof

# reset chunks
scoreboard players add $loadNum ld.warp 1