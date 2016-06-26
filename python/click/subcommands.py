#!/usr/bin/env python
# See README.md

import click

class Config(object):

    def __init__(self):
        self.verbose = False

# This `pass_config` creates a decorator which causes the Config object to
# be passed in as an argument to any decorated functions. The `ensure=True`
# is used to tell click to always create a new instance.
pass_config = click.make_pass_decorator(Config, ensure=True)


# Here's how you define the master command, that has a lot of subcommands.
# Put "global" options here:

@click.group()
@click.option('--verbose', is_flag=True)
@click.option('--outdir', type=click.Path())
@pass_config
def cli(config, verbose, outdir):
    config.verbose = verbose
    config.outdir = outdir if outdir else 'reports'
    if (verbose):
        print('Wassup!')
    pass


# Note that when you change to subcommand, this changes from `click.command()`
# to `@cli.command()`.
@cli.command()
@click.option('--name', default='Fred', help='Name to greet.')
@click.option('--repeat', default=1, help='Redundantly repetitiveness')
@click.argument('outfile', type=click.File('w'), default='-', required='False')
@pass_config
def speak(config, name, repeat, outfile):
    """
    Very nice script
    """
    if (config.verbose):
        print('Verbose mode: outfile: ' + str(outfile))
        print('outdir: ' + config.outdir)
    for x in range(repeat):
        print("Hello world; I mean " + name, file=outfile)
