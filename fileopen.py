# -*- coding: utf-8 -*-
"""
Created on Sun Nov 12 20:41:58 2017

@author: sumit
"""

import os
print(os.getcwd()) # see where you are
os.chdir(r'S:\cgu\research\project Oxy\before the pressure\brian\15 mm') # use a raw string so the backslashes are ok
print(os.getcwd()) # convince yourself that you're in the right place
print(os.listdir()) # make sure the file is in here
with open("BRIAN_thumb", 'r') as myfile: # assuming you need to rea