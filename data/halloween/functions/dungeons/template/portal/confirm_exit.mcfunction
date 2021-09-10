
scoreboard players enable @s hal.confirmExit
tellraw @s [{"text":"You are attempting to leave the dungeon party! If you leave now, the dungeon will be reset and your entire party will be kicked from the dungeon! Click ","color":"aqua"},{"text":"here","color":"dark_purple","underlined":true,"hoverEvent":{"action":"show_text","contents":[{"text":"Teleport to Overworld and Reset Dungeon"}]},"clickEvent":{"action":"run_command","value":"/trigger hal.confirmExit set 1"}},{"text":" if you are okay with that and want to leave."}]
execute at @s run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 
teleport @s ~2.5 ~-1 ~2.5