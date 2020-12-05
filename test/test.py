# -*- coding: utf-8 -*-


import time
def test():
    print(time.time())
    for i in range(0,100000000):
        i = i+1
    print(time.time())

def test1():
    for i in range(0,100000000):
        i = i+1
    print(time.time())

test()
print('wozaizhe--->',time.time())
test1()
