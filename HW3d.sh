# wget http://mag.gmu.edu/tmp/astro.csv.gz
# gunzip astro.csv.gz

tail -110 astro.csv > astrosnippet.csv
head -10 astrosnippet.csv > astrosnippet2.csv

# This is in the wrong order should be
head -110 astro.csv > tmp.csv
tail -10 tmp.csv > lines.csv
# or
head -110 astro.csv | tail -10 > lines.csv


