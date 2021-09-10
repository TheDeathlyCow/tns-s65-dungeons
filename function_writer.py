import os

class BlockPos:
    def __init__(self, x : float, y : float, z : float) -> None:
        self.x = x
        self.y = y
        self.z = z

    def __str__(self):
        return f'{self.x} {self.y} {self.z}'
    
    __repr__ = __str__

HUB_COORDINATES = BlockPos(-34, 8, -203)
SPAWN_COORDINATES = BlockPos(-3, 4, -42)
COMMANDS = 'commands'
COMMENTS = 'comments'

class FuncWriter:

    def __init__(self, base_directory: str, arena_name: str) -> None:
        self.base_directory = base_directory
        self.arena_name = arena_name
        try:
            os.makedirs(self.base_directory)
        except FileExistsError:
            pass

    def write_functions(self, functions : dict, format=True):
        for function_name in functions.keys():
            func = functions[function_name]
            commands = func[COMMANDS]
            comments = func.get(COMMENTS, None)
            self.write_function(function_name, commands, comments=comments, format=format)

    def write_function(self, name: str, commands: list, comments=None, format=True) -> None:
        """
        Writes a given list of commands to a .mcfunction file. Commands do not need endline characters.
        Do not include extension in filename.
        Filename should be something like {arena_name}/{function_name}
        """
        with open(self.base_directory + name + '.mcfunction', 'w') as func:
            if comments is not None:
                for comment in comments:
                    func.write("#" + comment + "\n")
                func.write('\n')

            for command in commands:
                to_write = command + '\n'
                if format:
                    to_write = to_write.format(self.arena_name)
                func.write(to_write)