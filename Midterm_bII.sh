# Bash program that runs 20 times and waits 5 seconds
 # after each run.
 
 # Remove existing log file.
 rm -f repeater.log
 # Initialize a counter variable.
 COUNTER=0
 # Run commands in while loop 20 times
 # (-lt mean less than in Bash)
 while [ $COUNTER -lt 20 ]; do
 	 echo "Starting iteration $COUNTER"
     let COUNTER=$COUNTER+1
     # Assign the ouptut of the command
     # date +'%Y %m %d %H %M %S.%N'
     # to variable START
     START=$(date +'%Y %m %d %H %M %S.%N')
     # Display the value of the variable START
     echo "$START"
     
     # Not needed
     ps aux --sort=-pcpu | perl -pe 's/ +/,/g' | tail -285 | head -10 > processes.txt

     ps aux --sort=-pcpu | perl -pe 's/ +/,/g' | tail -285 | head -10 | cut -d "," -f3-4,11 >> repeater.log
 
     # Wait 5 seconds before continuting on.
     sleep 5
 done
