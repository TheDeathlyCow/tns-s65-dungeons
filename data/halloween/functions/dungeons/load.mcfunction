
### 16 CHARS ------------ 0123456789ABCDEF
scoreboard objectives add hal.playerCount dummy
scoreboard objectives add hal.maxRuns dummy
scoreboard objectives add hal.maxPlayers dummy
scoreboard objectives add hal.runCount dummy
scoreboard objectives add hal.confirmExit trigger
scoreboard objectives add hal.1stPlyrEntr dummy

#### DUNGEON STATES ####
# 0 - Empty
# 1 - Players are in, not fighting boss
# 2 - Boss fight is in progress
# 3 - Boss has been defeated, before reset
scoreboard objectives add hal.state dummy
scoreboard players set $EMPTY hal.state 0
scoreboard players set $PLAYERS_IN_DUNGEON hal.state 1
scoreboard players set $FIGHTING_BOSS hal.state 2
scoreboard players set $BOSS_DEFEATED hal.state 3


### CONSTANTS ###
scoreboard objectives add hal.CONSTANTS dummy
scoreboard players set MAX_INT16 hal.CONSTANTS 32767
scoreboard players set MAX_UINT16 hal.CONSTANTS 65535
scoreboard players set MAX_INT32 hal.CONSTANTS 2147483647
scoreboard players set TRUE hal.CONSTANTS 1
scoreboard players set FALSE hal.CONSTANTS 0

function halloween:random/load
function halloween:name_tags/load

function halloween:dungeons/warp/load