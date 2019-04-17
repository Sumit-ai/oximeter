# -*- coding: utf-8 -*-
"""
Created on Mon Jul  2 17:36:38 2018

@author: Sumit
"""

import pandas as pd 
import xlrd
# path:  please specify here 
xls = pd.ExcelFile('C:\\Users\\Sumit\\Desktop\\JuPYTER\\example BCV.xlsx')
 
df1 = pd.read_excel(xls, 'Raw')
df2 = pd.read_excel(xls, 'processed')

#print the column names
print("" ,df1.columns)
print(df2.columns)

#get the values for a given column ie. ::  columnB: col_B and ColumnD: col_D
col_A = df1['S/No'].values 
col_C = df1['Incident_Date'].values
col_B = df1['DSN'].values 
col_D = df1['Replacement_DSN_On_Bus'].values
col_E = df1['Fault_Detail']
col_F = df1['Root_Cause']

col_A = list(col_A)
col_B = list(col_B)
col_C = list(col_C)
col_D = list(col_D)
col_E = list(col_E)
col_F = list(col_F)

#print(col_D)
#print(len(col_D))

col_B = df1['DSN'].values
#print(col_B)
#print(len(col_B))


# number of times repeat using counter: 
from collections import Counter 
rep_col_D = Counter(col_D)
#print(rep_col_D)
# convert the counter into the list  
lis_d  = list(rep_col_D)
#lis_d


# test the repeat
d = Counter(lis_d)
#d



ind_ger = col_D.index(lis_d[0] )
len(col_D)
col_D[0] == lis_d[0]





    
k = 0
f = 0 
for h in range(len(lis_d)):
    for i in range(len(col_D)):
        if lis_d[f] == col_D[k]:
            an = print(col_A[i],',', col_B[i],',', col_C[i],',', col_D[i],',', col_E[i],',', col_F[i])
        
        elif lis_d[f] == col_B[k]:
            an = print(col_A[i],',', col_B[i],',', col_C[i],',', col_D[i],',', col_E[i],',', col_F[i])
        
        k = k+1

    f = f+1

