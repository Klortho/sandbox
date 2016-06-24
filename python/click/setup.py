from setuptools import setup

setup(
    name='site-scan',
    version='0.0.1',
    py_modules=['hello'],
    install_requires=[
        'Click',
    ],
    entry_points='''
        [console_scripts]
        hello=hello:cli
    ''',
)
