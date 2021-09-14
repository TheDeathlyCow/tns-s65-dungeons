
# Generate the next number in the LCG sequence
# and assign it to current hal.rand

scoreboard players operation current hal.rand *= multiplier hal.rand
scoreboard players operation current hal.rand += increment hal.rand
scoreboard players operation current hal.rand %= modulus hal.rand




