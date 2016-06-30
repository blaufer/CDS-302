import struct
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

# See also http://code.activestate.com/recipes/577610-decoding-binary-files/

# Write a single unsigned 16 bit integer to file.bin
# See https://docs.python.org/2/library/struct.html
# for format descriptions
with open('file.bin','wb') as fout:
    while x < math.pow(2,16):
    	fout.write(struct.pack('H',A[x]))
    	x += 1


# Read a single unsigned 16 bit integer from file.bin
# read(2) means "read two bytes".
#with open('file.bin','rb') as fin:
#    print struct.unpack('H',fin.read(2))[0]