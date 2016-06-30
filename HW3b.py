# wget http://mag.gmu.edu/tmp/astro.csv.gz
# gunzip astro.csv.gz
# head -1000 astro.csv > astro1000.csv
# python HW3b.py > astro1000.sql
# sqlite3 astro1000.db < astro1000.sql

import csv

print 'PRAGMA foreign_keys=OFF;'
print 'BEGIN TRANSACTION;'
print 'CREATE TABLE ASTRO (Preview text, Collection text, Obs_ID text);'

with open('astro1000.csv','r') as csvfile:
     contents = csv.reader(csvfile, delimiter=',')
     for row in contents:
	 line = row[0] + "','" + row[1] + "','" + row[2]
         print "INSERT INTO ASTRO (Preview, Collection, Obs_ID) VALUES ('" + line + "');"
         
print 'COMMIT;'
