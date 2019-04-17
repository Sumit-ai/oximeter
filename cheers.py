# -*- coding: utf-8 -*-
"""
Created on Sun May  6 02:13:32 2018

@author: Sumit
"""
an_letter = "aeiouAEIOU" 
word = input("please enter the name you interested in: ")
times = int(input("please give the level of intensity: "))
for char in word:
      if char in an_letter:
          print("give me an " + char + "!!!!")
      else: 
          print("give me a " +  char + "!!!!")
print("What does that spell??")
for i in range(times):
    print(word, "!!!!")
    