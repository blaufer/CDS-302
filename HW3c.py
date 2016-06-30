# wget http://mag.gmu.edu/tmp/astro.csv.gz
# gunzip astro.csv.gz
# head -10000 astro.csv > astro10000.csv
# python HW3c.py > astro100.sql
# sqlite3 astro10000.db < astro10000.sql

import csv

print 'PRAGMA foreign_keys=OFF;'
print 'BEGIN TRANSACTION;'
print 'CREATE TABLE ASTRO (Preview text, Collection text, Obs_ID text);'

with open('astro10000.csv','r') as csvfile:
     contents = csv.reader(csvfile, delimiter=',')
     for row in contents:
	 line = row[0] + "','" + row[1] + "','" + row[2]
         print "INSERT INTO ASTRO (Preview, Collection, Obs_ID) VALUES ('" + line + "');"
         
print 'COMMIT;'
