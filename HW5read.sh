curl http://mag.gmu.edu/git-data/cds302/bou20130402vmin.min | grep "2013" > bou20130402vmin.min
sed "s/-/ /g" bou20130402vmin.min | sed "s/:/ /g" | sed "s/  */ /g" > bou-edited.min
