execute if entity @r[tag=playing_warp,scores={hal.confirmExit=1}] run function halloween:dungeons/warp/reset
execute as @a[tag=leave_warp] at @s in minecraft:overworld run function halloween:dungeons/warp/portal/exit
execute unless score warp hal.state = $EMPTY hal.state unless entity @r[tag=playing_warp] run function halloween:dungeons/warp/reset
function halloween:dungeons/warp/boss/tick