function halloween:dungeons/template/count_players
execute if score template hal.playerCount matches 1 run function halloween:dungeons/template/portal/confirm_exit
execute unless score template hal.playerCount matches 1 in minecraft:overworld run function halloween:dungeons/template/portal/exit