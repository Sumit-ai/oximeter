# -*- coding: utf-8 -*-
"""
Created on Tue Mar 20 18:04:56 2018
 binary search algorithm 
@author: sumit
"""
number = 6 
import numpy as np 
a = np.array([1, 2, 3, 5, 153, 6, 7, 5, 78, 89, 90, 5, 8098])

for N in range(1, len(a)):
    if a[N] == 5 :
        print(a[N], "is at ",str(N+1),"th position")

     
        