from function_writer import *
import textwrap
from reset import *
from distutils.dir_util import copy_tree
import os

DUNGEONS = 'data/halloween/functions/dungeons/'
class Dungeon:

    def __init__(self, dungeon_id: str, name: str) -> None:
        self.dungeon_id = dungeon_id
        self.name = name

    def generate(self) -> None:
        directory = DUNGEONS + self.dungeon_id
        copy_tree(DUNGEONS + 'template', directory)

        self.copy_contents(directory)

    
    def modify_file(self, filename):
        content = ""
        with open(filename, 'r') as infile:
            content = infile.read()

        content = content.replace('template', self.dungeon_id)
        content = content.replace('TEMPLATE_NAME', self.name)
        
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
    # warp = Dungeon('warp', 'Warped Gardens')
    # warp.generate()
    pass

if __name__ == '__main__':
    gen_warped_gardens()

