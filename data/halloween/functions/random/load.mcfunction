
# Create Random Number Generator using a 
# Linear Congruence Generator (LCG)

scoreboard objectives add hal.rand dummy

scoreboard players set modulus hal.rand 2147483647
scoreboard players set multiplier hal.rand 2147483629 
scoreboard players set increment hal.rand 2147483587 

function halloween:random/next_int