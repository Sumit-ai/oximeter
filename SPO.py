# -*- coding: utf-8 -*-
"""
Created on Mon May 28 16:14:59 2018
np.divide(a,b)
np.multiply(a,b)
Formula: SaO2 = abs((HBLR - HBLIR.*Ros)/ (HBLR - HBOLR)+(HBOLIR - HBLIR).*Ros);;
@author: Sumit
"""
import numpy as np 
np.seterr(divide='ignore', invalid='ignore')
RH = [1, 2, 3, 4, 5, 6]
RL = [1, 4, 5, 6, 6, 7]
IRH = [1, 2, 3, 4, 5, 6]
IRL = [1, 4, 5, 6, 6, 7]
x = np.divide(RL,RH)
y = np.divide(IRL,IRH)
aw = np.log(x)
sw = np.log(y)
Ros = np.divide(aw,sw)
HBLR = 0.811
HBLIR = 0.1974
HBOLR = 0.098969
HBOLIR = 0.259896
qw = (HBLR - np.multiply(HBLIR,Ros))
rt = HBOLIR - HBLIR
wq = ((HBLR - HBOLR) + np.multiply(rt,Ros))
SaO2 = abs(np.divide(qw,wq))
    