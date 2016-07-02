# Creates file to import into SQL database
# First few lines give bash script to download and
# how to move into sqlite3


# wget http://mag.gmu.edu/tmp/astro.csv.gz
# gunzip astro.csv.gz
# python HW3e.py > astro.sql
# sqlite3 astro.db < astro.sql

import csv

print 'PRAGMA foreign_keys=OFF;'
print 'BEGIN TRANSACTION;'
print 'CREATE TABLE ASTRO (Preview text, Collection text, Obs_ID text);'

with open('astro.csv','r') as csvfile:
     contents = csv.reader(csvfile, delimiter=',')
     for row in contents:
	 line = row[0] + "','" + row[1] + "','" + row[2] + "','" + row[3]
         print "INSERT INTO ASTRO (Preview, Collection, Obs_ID) VALUES ('" + line + "');"
	#print ",".join(row)
print 'COMMIT;'
