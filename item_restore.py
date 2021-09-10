

from typing import Iterable
from function_writer import *
import textwrap

RESTORE_DIR = 'data/tns65_halloween/functions/inv_restore/'

def get_slot_type_commands(slot: str, num_slots: int, nbt_start: int=0, slots: Iterable=None) -> list[str]:
    commands = []
    if slots == None:
        slots = range(0, num_slots)

    for item in slots:
        commands.append(textwrap.dedent(f"""\
            item replace block 0 0 0 container.0 with structure_void
            data modify block 0 0 0 Items[0].id set from storage rx:io playerdb.player.data.thedeathlycow.halloween21_restore_inv[{{Slot:{nbt_start}b}}].id
            data modify block 0 0 0 Items[0].Count set from storage rx:io playerdb.player.data.thedeathlycow.halloween21_restore_inv[{{Slot:{nbt_start}b}}].Count
            data modify block 0 0 0 Items[0].tag set from storage rx:io playerdb.player.data.thedeathlycow.halloween21_restore_inv[{{Slot:{nbt_start}b}}].tag

            item replace entity @s {slot}.{item} from block 0 0 0 container.0
            """))
        nbt_start += 1 
    return commands

def write_restore_func():
    func = {
        COMMANDS: [
            textwrap.dedent("""\
            clear @s 
            function rx.playerdb:api/get_self
            """),
            *get_slot_type_commands("weapon", 1, nbt_start=-106, slots=["offhand"]),
            *get_slot_type_commands("armor", 4, nbt_start=100, slots=["feet", "legs", "chest", "head"]),
            *get_slot_type_commands("inventory", 27, nbt_start=9),
            *get_slot_type_commands("hotbar", 9),
            "clear @s structure_void"
        ]
    }

    writer = FuncWriter(RESTORE_DIR, "")
    writer.write_function("get_items", func[COMMANDS], format=False)

if __name__ == '__main__':
    write_restore_func()