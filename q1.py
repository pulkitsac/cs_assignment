#!/usr/bin/python
def main():
    from sys import exit
    # numstr = raw_input("Number  ")
    # b = input("Base ")
    from sys import argv
    if (len(argv)!= 3):
        print "Invalid input"
        exit()
    numstr = argv[1].strip()
    b = int(argv[2])


    templen = len(numstr)
    if b < 2 or b > 36:
        print "Invalid input"
        return
    sign = 1
    i = 0
    j = 0
    if numstr[i] == '-':
        i = 1
        sign = -1
    count  = 0
    k = i
    for j in range(templen):
        if numstr[j]!='0':
            break
        else:
            count +=1


    num=numstr[count:templen]
    length= len(num)
    if length == 1 and num[0] == '.':
        print "Inavlid input 2"
        exit()
    for m in range(0,templen):
        if numstr[m] != '.':
            if  numstr[m] < '0' or numstr[m] > 'Z' or (numstr[m] > '9' and numstr[m] < 'A'):
                print "Invalid input 3"
                exit()
            elif numstr[m] <= '9'and (ord(numstr[m]) - 48) >= b:
                print "Invalid input 4"
                exit()
            elif numstr[m] > '9'and (ord(numstr[m]) - 55) >= b:
                print "Invalid input 5"
                exit()
    base = b
    sum = 0
    while(k<len(numstr) and numstr[k] != '.' ):
        k = k + 1
    for x in range(k - 1, i - 1, -1):
        if ord(numstr[x]) >= 48 and ord(numstr[x]) <= 57:
            sum = sum + (ord(numstr[x]) - 48)*(base**(k-1-x))
        if ord(numstr[x]) >= 65 and ord(numstr[x]) <= 90:
            sum = sum + (ord(numstr[x]) - 55)*(base**(k-1-x))
        #base = base*b
    # base = b    
    for y in range(k + 1, templen):
        if ord(numstr[y]) >= 48 and ord(numstr[y]) <= 57:
            sum = sum + ((ord(numstr[y]) - 48)*1.0)/(base**(y-k))
        if ord(numstr[y]) >= 65 and ord(numstr[y]) <= 90:
            sum = sum + ((ord(numstr[y]) - 55)*1.0)/(base**(y-k))

    if  sign*sum >= -999999999 and sign*sum <= 999999999:
        print (sign*sum)
    else:
        print ("Output out of range")    
    # print(numstr,b)       
if  __name__=='__main__':
    main()

