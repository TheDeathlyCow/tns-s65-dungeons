function halloween:dungeons/template/count_players

# calculate time since first player entered dungeon
execute store result score $curr hal.1stPlyrEntr run time query gametime
scoreboard players operation $curr hal.1stPlyrEntr -= template hal.1stPlyrEntr
scoreboard players operation $curr hal.1stPlyrEntr %= MAX_INT32 hal.CONSTANTS

scoreboard players add @s hal.runCount 0

# set dungeon constants to THIS, so they can be easily referenced
# in a predicate
scoreboard players operation @s hal.1stPlyrEntr = template hal.1stPlyrEntr
scoreboard players operation @s hal.playerCount = template hal.playerCount
scoreboard players operation @s hal.maxPlayers = template hal.maxPlayers
scoreboard players operation @s hal.maxRuns = template hal.maxRuns
scoreboard players operation @s hal.state = template hal.state

# remove 1 for exclusive bounds check
scoreboard players remove @s hal.maxPlayers 1

execute if predicate halloween:can_join_party in minecraft:the_nether run function halloween:dungeons/template/portal/enter
execute unless predicate halloween:can_join_party run function halloween:dungeons/template/portal/deny_entry

# reset dungeon constants - dont need to store them
scoreboard players reset @s hal.1stPlyrEntr
scoreboard players reset @s hal.playerCount
scoreboard players reset @s hal.maxPlayers
scoreboard players reset @s hal.maxRuns 
scoreboard players reset @s hal.state 