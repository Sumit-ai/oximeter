# -*- coding: utf-8 -*-
"""
Created on Thu Jan 18 12:54:49 2018

@author: sumit
"""

import pandas as pd

# Create a dataframe with an x column containing values from -10 to 10
df = pd.DataFrame ({'x': range(-10, 11)})

# Add a y column by applying the solved equation to x
df['y'] = (3*df['x'] - 4) / 2

#Display the dataframe
df
