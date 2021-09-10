
### 16 CHARS ------------ 0123456789ABCDEF
scoreboard objectives add hal.playerCount dummy
scoreboard objectives add hal.maxRuns dummy
scoreboard objectives add hal.maxPlayers dummy
scoreboard objectives add hal.runCount dummy
scoreboard objectives add hal.confirmExit trigger
scoreboard objectives add hal.1stPlyrEntr dummy


### CONSTANTS ###
scoreboard objectives add hal.CONSTANTS dummy
scoreboard players set MAX_INT hal.CONSTANTS 2147483647


function halloween:dungeons/template/load