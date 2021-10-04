execute if entity @r[tag=playing_template,scores={hal.confirmExit=1}] run function halloween:dungeons/template/reset
execute as @a[tag=leave_template] at @s in minecraft:overworld run function halloween:dungeons/template/portal/exit
execute unless score template hal.state = $EMPTY hal.state unless entity @r[tag=playing_template] run function halloween:dungeons/template/reset
function halloween:dungeons/template/boss/tick