execute as @a at @s run playsound minecraft:block.end_portal.spawn master @s ~ ~ ~ 10 0.3
execute store result score template hal.1stPlyrEntr run time query gametime
tellraw @a [{"text":"[!!] ","color":"dark_purple","bold":true},{"text": "All party members must join within 2 minutes","color":"aqua"},{"text":" [!!]"}]


scoreboard players operation template hal.state = $PLAYERS_IN_DUNGEON hal.state