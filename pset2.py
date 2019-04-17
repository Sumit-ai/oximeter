# -*- coding: utf-8 -*-
"""
Created on Sun May  6 20:03:42 2018
File input and read the data 
@author: Sumit

"""
# read the text file form the location
# if the csv file is available then use pandas library https://www.kaggle.com/dansbecker/selecting-and-filtering-in-pandas 

import numpy as np 
data =  np.genfromtxt('thumb.txt', delimiter=' ')

IRRAW = []
RRAW = []
t = []
for a in range (0, len(data)) :
    IRRAW.append(data[a,12])
    
for b in range (0, len(data)) :
    RRAW.append(data[b,11])

for c in range (0, len(data)) :
    t.append(data[c,0])
'''
import pylab
pylab.plot(t, IRRAW)
pylab.title('IRRAW vs Time ')
pylab.xlabel('Time')
pylab.ylabel('IRRAW')
pylab.show()
  

pylab.plot(t, RRAW)
pylab.title('RRAW vs Time')
pylab.xlabel('Time')
pylab.ylabel('RRAW')
pylab.show()
'''
y = IRRAW
x = t

import matplotlib.pyplot as plt
from scipy.interpolate import UnivariateSpline
s = UnivariateSpline(x, y, s=34000)
xs = t
ys = s(xs)
plt.plot(x, y, '.')
plt.plot(xs, ys)
plt.show()

   
    
