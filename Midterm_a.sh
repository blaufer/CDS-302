echo -e "1,2,3,4\n5,6,7,8\n9:10:11:12\n12#13#15#15" > midterm.txt
sed "s/,/ /g" midterm.txt | sed "s/:/ /g" | sed "s/#/ /g"
