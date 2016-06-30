# Why tail -285?
ps aux --sort=-pcpu | perl -pe 's/ +/,/g' | tail -285 | head -10 > processes.txt
ps aux --sort=-pcpu | perl -pe 's/ +/,/g' | tail -285 | head -10 | cut -d "," -f3-4,11 > repeater.log
