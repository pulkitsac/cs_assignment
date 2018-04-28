#!/usr/bin/python

def readfile(fileName):
    folder = open(fileName)
    x_train = []
    y_train = []
    firstline = 0
    for line in folder:
        if firstline == 0:
            firstline = firstline + 1
            continue
        line=line.strip().split(',')
        x_train.append(float(line[0]))
        y_train.append(float(line[1]))
    return (x_train, y_train)

def plotversus(x,w):
    wtransx = []
    for i in range(0, len(x)):
        p = 1*w[0] + x[i]*w[1]
        wtransx.append(p)
    return wtransx  

def calculaterms(mt, x_t, y_t):
    sum = 0
    for i in range(0, len(x_t)):
        val = (1*mt[0] + x_t[i]*mt[1]) - y_t[i]
        sum = sum + (val**2)
    mean = sum/(len(x_t))
    from math import sqrt
    return sqrt(mean)    
   
def rms(w,w_direct):
    (x_test, y_test) = readfile('test.csv')
    rmserror1 = calculaterms(w, x_test, y_test)
    rmserror2 = calculaterms(w_direct, x_test, y_test)
    return (rmserror1, rmserror2)
    
def main():
    (X,Y) = readfile('train.csv')
    eta = 0.00000001
    numdata = len(X)
    import numpy as np
    x = np.asarray(X).reshape(numdata,1)
    y = np.asarray(Y).reshape(numdata,1)
    w = np.random.rand(2,1)
    xp = np.insert(x,0,1,axis=1) #reshaping x
    xtransX = np.matmul(xp.transpose(),xp)
    xtray = (np.matmul(xp.transpose(),y))
    xInv = np.linalg.inv(xtransX)
    w_direct = np.matmul(xInv,xtray)
    from matplotlib import pyplot as plt
    plt.grid()
    plt.plot(X,Y,'.',color='blue',linewidth  = 0.2)
    plt.plot(X,plotversus(X,w),color = 'green',linewidth  = 0.2)
    plt.plot(X,plotversus(X,w_direct),color = 'red',linewidth  = 0.2)
    for i in range(0,9):
        for j in range(0, numdata):
            xT = np.random.rand(2,1)
            xT[0] = 1
            xT[1] = X[j]
            w = w - eta*(1*w[0] + X[j]*w[1] - Y[j])*(xT)
            if(j%100 == 0):
                plt.plot(X,plotversus(X,w),linewidth  = 0.2)

    plt.plot(X,plotversus(X,w),color = 'yellow',linewidth  = 0.2)            
    plt.show()
    
    (rmserror1,rmserror2) = rms(w, w_direct) 
    print rmserror1
    print rmserror2
    
if __name__ == "__main__":
    main()

