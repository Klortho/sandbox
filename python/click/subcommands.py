# These notes are from going through this quick video tutorial:
# https://www.youtube.com/watch?v=kNke39OZ2k0.

# Some notes:
# - arguments cannot have help text. If you want to document them, do it in the
#   function's docstring.
# - Even if you set a default value on an argument, you still have to set
#   `required='False'`
# - Output files are opened lazily.

# Subcommands are don

import click

@click.group



@click.command()
@click.option('--name', default='Fred', help='Name to greet.')
@click.option('--repeat', default=1, help='Redundantly repetitiveness')
@click.argument('outfile', type=click.File('w'), default='-', required='False')
def speak_to_me(name, repeat, outfile):
    """
    Very nice script
    """
    print('outfile: ' + str(outfile))
    for x in range(repeat):
        print("Hello world; I mean " + name, file=outfile)
