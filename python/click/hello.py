#!/usr/bin/env python
# See README.md

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
