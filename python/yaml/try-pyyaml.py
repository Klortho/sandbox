#!/usr/bin/env python3

import yaml
import pprint

pp = pprint.PrettyPrinter(indent=4)


class Monster(yaml.YAMLObject):
    yaml_tag = u'!Monster'
    def __init__(self, name, hp, ac, attacks):
        self.name = name
        self.hp = hp
        self.ac = ac
        self.attacks = attacks
    def __repr__(self):
        return "%s(name=%r, hp=%r, ac=%r, attacks=%r)" % (
            self.__class__.__name__, self.name, self.hp, self.ac, self.attacks)

with open("monster.yaml", "r") as stream:
    m = yaml.load(stream)

pp.pprint(m)

