scoreboard players operation current warp.bossState = $IDLE warp.bossState
teleport @e[tag=warped_boss] ~ -1000 ~
scoreboard players set $time_since_start warp.timer 0

bossbar remove minecraft:warped_boss

