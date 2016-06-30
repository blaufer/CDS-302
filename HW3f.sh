# Challenge from 4.4

cut -d "," -f2 astro.csv | unique astrou.csv
wc astrou.csv

# When I tried to do all three at once (move the wc command up a line and place a | in between after removing astrou.csv from both), it wouldn't work and I'm not sure why.

# command is uniq.  You code is piping output of cut to uniq, but then this output is ignored because
# you gave uniq a file to read from.  
# See http://bobweigel.net/cds302/index.php?title=RDMS#Problems_3
