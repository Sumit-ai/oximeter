# -*- coding: utf-8 -*-
"""
Created on Thu Jun 14 19:13:20 2018

@author: Sumit
"""

# Definition of radius
r = 192500

# Import radians function of math package
from math import radians 

# Travel distance of Moon over 12 degrees. Store in dist.

phi = radians(12)
dist = r*phi

# Print out dist
print(dist)

