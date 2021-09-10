tellraw @a [{"text":"Reset template.","color":"light_purple"}]
scoreboard players set template hal.1stPlyrEntr -1 
execute as @a[tag=indungeon_template] in minecraft:overworld run function halloween:dungeons/template/portal/exit

### PLUGIN THING - Reset chunks ###
scoreboard players add template arenas.loadNum 1 