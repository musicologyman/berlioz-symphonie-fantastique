#!/usr/bin/env python3

import csv
import os
from collections import namedtuple

RenameSpec = namedtuple('RenameSpec', 'oldname newname')

def read_rename_spec(filename):
  with open(filename, newline='') as fp:
    return [RenameSpec(*tuple(row)) for row in csv.reader(fp)]


rename_spec = read_rename_spec('rename.csv')

for oldname, newname in rename_spec:
  if os.path.exists(oldname):
    os.rename(oldname, newname) 
  else:
    print("The file {} does not exist.".format(oldname))


