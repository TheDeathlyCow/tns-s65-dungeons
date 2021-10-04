scoreboard objectives add warp.bossState dummy
scoreboard objectives add warp.timer dummy

scoreboard players add warp hal.playerCount 0
scoreboard players add warp hal.1stPlyrEntr 0
scoreboard players add warp hal.state 0
scoreboard players add $time_since_start warp.timer 0
scoreboard players set $TIME_BETWEEN_SUMMONS warp.timer 600


scoreboard players set $IDLE warp.bossState 0
scoreboard players set $STAGE1 warp.bossState 1
scoreboard players set $STAGE2 warp.bossState 2
scoreboard players set $STAGE3 warp.bossState 3
scoreboard players set $VICTORY warp.bossState 4
scoreboard players add current warp.bossState 0

# VARIABLES TO ADJUST
scoreboard players set warp hal.maxRuns 100
scoreboard players set warp hal.maxPlayers 100