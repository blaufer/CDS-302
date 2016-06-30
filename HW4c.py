import numpy

x = numpy.random.random((100000,1))

print 'PRAGMA foreign_keys=OFF;'
print 'BEGIN TRANSACTION;'
print 'CREATE TABLE Time (Number float);'
# Technically, you should have no single quotes because value is
# number.  But SQLite allows it (surprisingly):
# print "INSERT INTO Time (Number) VALUES (" + str(j) + ");"
for j in x:
     print "INSERT INTO Time (Number) VALUES ('" + str(j) + "');"

print 'COMMIT;'
