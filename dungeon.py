from function_writer import *
import textwrap
from reset import *
from distutils.dir_util import copy_tree
import os

DUNGEONS = 'data/halloween/functions/dungeons/'
class Dungeon:

    def __init__(self, dungeon_id: str, name: str, ow_pos: BlockPos, ne_pos: BlockPos) -> None:
        self.dungeon_id = dungeon_id
        self.name = name
        self.ow_pos = ow_pos
        self.ne_pos = ne_pos

    def generate(self) -> None:
        directory = DUNGEONS + self.dungeon_id
        copy_tree(DUNGEONS + 'template', directory)

        self.copy_contents(directory)

        summon_entities = DUNGEONS + self.dungeon_id + '/summon_enemies.mcfunction'
        if not os.path.isfile(summon_entities):
            with open(summon_entities, 'w') as s:
                print("Creating new summon entities file...")

    def modify_file(self, filename):
        content = ""
        with open(filename, 'r') as infile:
            content = infile.read()

        content = content.replace('template', self.dungeon_id)
        content = content.replace('TEMPLATE_NAME', self.name)
        content = content.replace('TEMPLATE_NE_POS', str(self.ne_pos))
        content = content.replace('TEMPLATE_OW_POS', str(self.ow_pos))
        
        with open(filename, 'w') as outfile:
            outfile.write(content)

    def copy_contents(self, directory):
        for filename in os.listdir(directory):
            curr_name = os.path.join(directory, filename)
            if os.path.isfile(curr_name):
                self.modify_file(curr_name)
            else:
                self.copy_contents(curr_name)


def gen_warped_gardens():
    ow_pos = BlockPos(21, 26, 7)
    ne_pos = BlockPos(8, 128, -10)
    warp = Dungeon('warp', 'Warped Village', ow_pos, ne_pos)
    # warp.generate()

    arena = Arena('warp', 'Warped Village', BlockPos(
        5094, 159, 5009), BlockPos(5176, 193, 5110))
    arena.generate()

if __name__ == '__main__':
    gen_warped_gardens()

