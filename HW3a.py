# wget http://mag.gmu.edu/tmp/astro.csv.gz
# gunzip astro.csv.gz
# Or: curl http://mag.gmu.edu/tmp/astro.csv.gz | gunzip > astro.csv
# head -100 astro.csv > astro100.csv
# python HW3a.py > astro100.sql
# sqlite3 astro100.db < astro100.sql
# See solutions for alternatives using input arguments from sys.argv: 
# http://bobweigel.net/cds302/index.php?title=RDMS#Problems_3
# Also note that your code puts a row with the header in it.  Should skip first row in astro.csv.
import csv

print 'PRAGMA foreign_keys=OFF;'
print 'BEGIN TRANSACTION;'
print 'CREATE TABLE ASTRO (Preview text, Collection text, Obs_ID text);'

with open('astro100.csv','r') as csvfile:
     contents = csv.reader(csvfile, delimiter=',')
     for row in contents:
	 line = row[0] + "','" + row[1] + "','" + row[2]
         print "INSERT INTO ASTRO (Preview, Collection, Obs_ID) VALUES ('" + line + "');"
         
print 'COMMIT;'
