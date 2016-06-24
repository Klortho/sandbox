# These notes are from going through this quick video tutorial:
# https://www.youtube.com/watch?v=kNke39OZ2k0.
#
# There are two python modules here:
# 1. hello.py (this one) - simple, no subcommands
# 2. subcommands.py
#
# Some notes:
# - arguments cannot have help text. If you want to document them, do it in the
#   function's docstring.
# - Even if you set a default value on an argument, you still have to set
#   `required='False'`
# - Output files are opened lazily.

import click

@click.command()
@click.option('--name', default='Fred', help='Name to greet.')
@click.option('--repeat', default=1, help='Redundantly repetitiveness')
@click.argument('outfile', type=click.File('w'), default='-', required='False')
def cli(name, repeat, outfile):
    """
    Very nice script
    """
    #print('outfile: ' + str(outfile))
    for x in range(repeat):
        print("Hello world; I mean " + name, file=outfile)
