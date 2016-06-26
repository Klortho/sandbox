# click - for building command line tools

See the [documentation](http://click.pocoo.org/5/).

These notes are from going through [this quick video 
tutorial](https://www.youtube.com/watch?v=kNke39OZ2k0). 

There are two python modules here:

1. hello.py - simple, no subcommands
2. subcommands.py

Some notes:

- arguments cannot have help text. If you want to document them, do it in the
  function's docstring.
- Even if you set a default value on an argument, you still have to set
  `required='False'`
- Output files are opened lazily.


To set up:

```
virtualenv -p python3 venv && . venv/bin/activate
pip install -r requirements.txt
pip install -e .
```

Then, run some commands:

```
hello --help

# This writes to floob.txt:
hello --name Zombo --repeat 6 floob.txt
```

Subcommands:

```
subcommands --help
subcommands speak --help
```
