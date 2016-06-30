import math

A = [0,1]
B = [0,1]
i = 2
while i < math.pow(2,16):
    A.append(i)
    i += 1

f = open('f1p.txt', 'w')
for j in A:
    f.write(str(A[j]) + '\n')
f.close()