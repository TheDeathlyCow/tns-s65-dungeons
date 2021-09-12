from function_writer import *
import os
import re
import textwrap

##* Datapack Functions *##

# summon_command = """execute align xz run summon armor_stand {0} {1} {2} {{{{NoGravity:1b,Marker:1b,Invisible:1b,PersistenceRequired:1b,Tags:["{3}"],ArmorItems:[{{{{}}}},{{{{}}}},{{{{id:"minecraft:barrier",Count:1b,tag:{{{{structure:"{4}"}}}}}}}},{{{{}}}}]}}}}\n"""
summon_command = """execute align xz run summon marker {0} {1} {2} {{{{Tags:["{3}"],data:{{{{"structure":"{4}"}}}}}}}}\n"""

summon_cloud_command = """execute align xz run summon area_effect_cloud {0} {1} {2} {{Duration:2147483647,Tags:["{3}"],Potion:"{4}"}}\n"""

##* Root folder *##
func_root = "data/reset/functions/"

##* Generator Functions *##

class SimpleArena:

    def __init__(self, name: str, proper_name: str, bound1: BlockPos, bound2: BlockPos) -> None:
        self.name = name
        self.proper_name = proper_name
        self.bound1 = bound1
        self.bound2 = bound2

        try:
            os.mkdir(func_root + f'{self.name}/')
        except FileExistsError:
            pass
        
        self._arena = {
            'reload': {
                COMMANDS: [
                    'scoreboard objectives add ld.{0} dummy',
                    'scoreboard objectives add sv.{0} dummy',
                    'scoreboard objectives add sv.{0} dummy',
                    'scoreboard objectives add {0}.dy dummy',
                    'scoreboard objectives add {0}.it dummy',
                    'scoreboard players add saveNum sv.{0} 0',
                    'scoreboard players add loadNum ld.{0} 0'
                ]
            },
            '_save': {
                COMMANDS: [
                    f"""tellraw @a {{{{"text":"Commencing save of {proper_name}!","color":"green"}}}}""",
                    "scoreboard players add saveNum sv.{0} 1"
                ]
            },
            '_load': {
                COMMANDS: [
                    f"""tellraw @a {{{{"text":"Commencing reset of {proper_name}!","color":"red"}}}}""",
                    "scoreboard players add loadNum ld.{0} 1"
                ]
            }
        }

    def generate(self):
        writer = FuncWriter(func_root + self.name + '/', self.name)
        writer.write_functions(self._arena)

class Arena:

    def __init__(self, name: str, proper_name: str, bound1: BlockPos, bound2: BlockPos) -> None:
        self.name = name
        self.proper_name = proper_name
        self.bound1 = bound1
        self.bound2 = bound2

        try:
            os.mkdir(func_root + f'{self.name}/')
        except FileExistsError:
            pass

        self._arena = {
            'reload': {
                COMMANDS: [
                    'scoreboard objectives add ld.{0} dummy',
                    'scoreboard objectives add sv.{0} dummy',
                    'scoreboard objectives add sv.{0} dummy',
                    'scoreboard objectives add {0}.dy dummy',
                    'scoreboard objectives add {0}.it dummy',
                    'scoreboard players add saveNum sv.{0} 0',
                    'scoreboard players add loadNum ld.{0} 0'
                ]
            },
            '_setup': {
                COMMANDS: self._get_setup_commands()
            },
            '_save': {
                COMMANDS: [
                    """tellraw @a {{"text":"To save all of the chunks of {0}, you must go to each structure block and click the 'SAVE' button (all caps)! I am very sorry this  is not automatic, there is no other way to save structure files to permanent memory.","color":"green"}}""",
                    "scoreboard players add saveNum sv.{0} 1"
                ]
            },
            '_load': {
                COMMANDS: [
                    f"""tellraw @a {{{{"text":"Commencing reset of {proper_name}!","color":"red"}}}}""",
                    "scoreboard players add loadNum ld.{0} 1"
                ]
            },
            'tick': {
                COMMANDS: [
                    """execute as @e[type=marker,tag={0}_structmarker] at @s run function reset:{0}/as_stand""",
                    'execute as @a[tag=playing_{0}] at @s unless score @s ld.{0} = loadNum ld.{0} run function reset:{0}/_leave_player'
                ],
                COMMENTS: [
                    '# Call this when a PLAYER leaves the arena, AS that player.'
                ]
            },
            'as_stand': {
                COMMANDS: [
                    """scoreboard players add @s sv.{0} 0""",
                    """scoreboard players add @s ld.{0} 0""",
                    """execute unless score @s sv.{0} = saveNum sv.{0} run function reset:{0}/save_stand""",
                    """execute if score @s {0}.dy matches 0.. run scoreboard players remove @s {0}.dy 1""",
                    """execute if score @s {0}.dy matches ..0 run function reset:{0}/load_stand""",
                    """scoreboard players remove @s[scores={{{0}.it=1..}}] {0}.it 1""",
                    """execute if score @s {0}.it matches ..0 run function reset:{0}/clear_items""",
                    """execute unless score @s ld.{0} = loadNum ld.{0} run function reset:{0}/prepare_stand_for_load""",
                ]
            },
            'clear_items': {
                COMMANDS: [
                    """teleport @e[type=item,dx=48,dy=48,dz=48] ~ -100 ~""",
                    """scoreboard players reset @s {0}.it""",
                    """forceload remove ~ ~"""
                ]
            },
            'save_stand': {
                COMMANDS: [
                    'setblock ~ ~ ~ air replace',
                    """setblock ~ ~-1 ~ structure_block[mode=save]{{name:"temp",posX:0,posY:1,posZ:0,sizeX:48,sizeY:48,sizeZ:48,rotation:"NONE",mirror:"NONE",mode:"SAVE",ignoreEntities:0b}} replace""",
                    """data modify block ~ ~-1 ~ name set from entity @s data.structure""",
                    """scoreboard players operation @s sv.{0} = saveNum sv.{0}"""
                ]
            },
            'prepare_stand_for_load': {
                COMMANDS: [
                    textwrap.dedent("""\
                    function reset:next_rand
                    forceload add ~ ~ 
                    scoreboard players operation @s {0}.dy = current rstrandom
                    scoreboard players operation @s {0}.dy %= max_delay rstrandom
                    scoreboard players operation @s ld.{0} = loadNum ld.{0}""")
                ]
            },
            'load_stand': {
                COMMANDS: [
                    """setblock ~ ~ ~ structure_block[mode=load]{{name:"temp",posX:0,posY:0,posZ:0,sizeX:48,sizeY:48,sizeZ:48,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b}} replace""",
                    """data modify block ~ ~ ~ name set from entity @s data.structure""",
                    "teleport @e[type=!player,type=!marker,dx=48,dy=48,dz=48] ~ -100 ~",
                    "teleport @e[type=item,dx=48,dy=48,dz=48] ~ -100 ~",
                    "scoreboard players operation @s ld.{0} = loadNum ld.{0}",
                    "scoreboard players reset @s {0}.dy",
                    textwrap.dedent("""\
                        fill ~ ~1 ~ ~ ~4 ~ air
                        setblock ~ ~1 ~ observer[facing=up]
                        setblock ~ ~4 ~ sand 
                        scoreboard players set @s {0}.it 5""")
                ]
            },
            '_join_player': {
                COMMANDS: [
                    'scoreboard players operation @s ld.{0} = loadNum ld.{0}'
                ],
                COMMENTS: [
                    '# Call this when a PLAYER enters the arena, AS that player.'
                ]
            },
            '_leave_player': {
                COMMANDS: [
                    'tellraw @s [{{"text":"The arena you are currently in has reset! Removing you from the arena now...","color":"gold"}},{{"text":"\\nThis may occur if you disconnected in the middle of a game and did not come back)","color":"red","italic":true}}]',
                    'playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 0.8',
                    'tag @s add leave_{0}'
                ],
                COMMENTS: [
                    '# This function is called when a player is in an arena they do not belong in, not generally when they leave.'
                ]
            }
        }

    def _get_setup_commands(self):
        setup_func = []
        setup_func.append("# AUTO GENERATED FUNCTION DO NOT EDIT")

        dx = self.bound1.x - self.bound2.x
        dy = self.bound1.y - self.bound2.y
        dz = self.bound1.z - self.bound2.z

        dx = dx if dx != 0 else 1
        dy = dy if dy != 0 else 1
        dz = dz if dz != 0 else 1

        x_dir = -abs(dx) // dx
        y_dir = -abs(dy) // dy
        z_dir = -abs(dz) // dz

        for x in range(self.bound1.x, self.bound2.x, 48 * x_dir):
            for y in range(self.bound1.y, self.bound2.y, 48 * y_dir):
                for z in range(self.bound1.z, self.bound2.z, 48 * z_dir):
                    
                    setup_func.append(f"""forceload add {x} {z}\n""")
                    setup_func.append(
                        f"execute positioned {x-1}.0 {y-1}.0 {z-1}.0 run kill @e[distance=..1,tag={{0}}_structmarker]")
                    setup_func.append(summon_command.format(x, y, z,
                                                            '{0}_structmarker',
                                                            f'reset:{{0}}/{x}.{y}.{z}'))
        setup_func.append("scoreboard players set loadNum ld.{0} 0")
        setup_func.append("function reset:{0}/save")
        setup_func.append("function reset:{0}/tick")
        setup_func.append("""forceload remove all""")
        return setup_func

    def generate(self):
        writer = FuncWriter(func_root + self.name + '/', self.name)
        writer.write_functions(self._arena)

##* Command-Line input Functions *##


def get_command_input_data():
    struct_name = get_structure_name()
    start_pos = get_pos("start")
    end_pos = get_pos("end")
    return (struct_name, start_pos, end_pos)


def get_structure_name():
    is_valid = False
    while not is_valid:
        structure_name = input(
            "Enter structure name (13 characters max, lowercase letters only): ")
        is_valid = re.search(r"^[a-z]{1,13}$", structure_name) != None
        if not is_valid:
            print("Invalid structure name, please try again.")
    return structure_name


def get_pos(name):
    is_valid = False
    while not is_valid:
        pos_str = input(
            f"Enter {name} position (integers only, of form 'x y z'): ")
        is_valid = re.search(r"^[0-9]+[ ][0-9]+[ ][0-9]+$", pos_str) != None
        if not is_valid:
            print("Invalid position, please try again (make sure to include spaces!).")
    pos_lst = pos_str.split(' ')
    for i, pos in enumerate(pos_lst):
        pos_lst[i] = int(pos)
    return tuple(pos_lst)


def main():
    input_data = get_command_input_data()
    structure_name = input_data[0]
    start_pos = input_data[1]
    end_pos = input_data[2]
    # generate(structure_name, start_pos, end_pos, "")

    # village test coords (5558, 32, 5095), (5821, 128, 5353)

    # new test:
    # Enter structure name (13 characters max, lowercase letters only): villagee
    # Enter start position (integers only, of form 'x y z'): 5825 20 3611
    # Enter end position (integers only, of form 'x y z'): 5633 128 3806


# def generate(structure_name, start_pos, end_pos, invalid_reset_function):
#     gen_setup(structure_name, start_pos, end_pos)
#     gen_on_reload(structure_name)
#     gen_save(structure_name)
#     gen_load(structure_name)
#     gen_tick(structure_name, invalid_reset_function)


# def reject_run():
#     print("Do not run this file! Run RUNME.py instead!")
#     exit_input = input("Press enter to continue...")


# if __name__ == '__main__':
#     run()
