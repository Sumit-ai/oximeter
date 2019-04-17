# -*- coding: utf-8 -*-
"""
Created on Mon Jun 25 13:36:04 2018

@author: Sumit
"""
import numpy as np

#matplotlib inline
import matplotlib.pyplot as plt

from matplotlib import rcParams
rcParams['figure.figsize'] = (10, 6)
rcParams['legend.fontsize'] = 16
rcParams['axes.labelsize'] = 16

def generate_data(k, A, sigma, omega, noise=0, n_outliers=0, random_state=0):
    y = A * np.exp(-sigma * np.array(k)) * np.sin(omega * np.array(k))
    rnd = np.random.RandomState(random_state)
    error = noise * rnd.randn(k.size)
    outliers = rnd.randint(0, k.size, n_outliers)
    error[outliers] *= 35
    return y + error

t_train = t
y_train = IRRAW


def fun(x, k, y):
    return x[0] * np.exp(-x[1] * np.array(k)) * np.sin(x[2] * np.array(k)) - y

x0 = np.ones(3)

from scipy.optimize import least_squares

res_lsq = least_squares(fun, x0, args=(t_train, y_train))
res_robust = least_squares(fun, x0, loss='soft_l1', f_scale=0.1, args=(t_train, y_train))

t_test = t
y_test = IRRAW

y_lsq = generate_data(t_test, *res_lsq.x)
y_robust = generate_data(t_test, *res_robust.x)

plt.plot(t_train, y_train, 'o', label='data')
plt.plot(t_test, y_test, label='true')
plt.plot(t_test, y_lsq, label='lsq')
plt.plot(t_test, y_robust, label='robust lsq')
plt.xlabel('$t$')
plt.ylabel('$y$')
plt.legend()
