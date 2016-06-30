import csv

print 'PRAGMA foreign_keys=OFF;'
print 'BEGIN TRANSACTION;'
print 'CREATE TABLE Repeater (CPU_Percent float, MEM_Percent float, COMMAND text);'

# I am surprised that SQLite allows values given as float with quotes.  You used syntax like
# VALUES('10.0','9.0','/bin/sh')
# but
# VALUES(10.0,9.0,'/bin/sh')
# is technically what should have been done.

with open('repeater.log','r') as csvfile:
     contents = csv.reader(csvfile, delimiter=',')
     for row in contents:
	 line = row[0] + "','" + row[1] + "','" + row[2]
         print "INSERT INTO Repeater (CPU_Percent, MEM_Percent, COMMAND) VALUES ('" + line + "');"
print 'COMMIT;'
