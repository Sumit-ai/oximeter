# -*- coding: utf-8 -*-
"""
Created on Mon Dec 25 11:26:08 2017

@author: sumit
"""

import math
import numpy as np
I = np.arange(0, 2*math.pi, 0.1)
import matplotlib.pyplot as plt
plt.figure()
plt.plot(I, np.cos(I), 'o-')
#plt.ion()
plt.show()
