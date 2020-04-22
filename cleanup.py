#!/usr/bin/env python3

from collections import namedtuple
import os
from pprint import pprint


midi_files = [ file for file in os.listdir() 
               if os.path.splitext(file) in [".mid", ".midi"] ]

for file in midi_files:
  os.remove(file)

page_2_files = [ file for file in os.listdir()
                 if file.find('page2') > -1 ]

for file in page_2_files:
  os.remove(file)

page_1_files = [ file for file in os.listdir()
                 if file.find('-page1') > -1 ]

for file in page_1_files:
  newname = file.replace('-page1','')
  os.rename(file, newname)

