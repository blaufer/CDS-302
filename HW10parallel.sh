x=`date +"%N"`
rm -f out*.txt
echo "Starting Parallel Run"
octave --silent --eval "A5" > out1.txt &
octave --silent --eval "A5" > out2.txt &
octave --silent --eval "A5" > out3.txt &
octave --silent --eval "A5" > out4.txt &
octave --silent --eval "A5" > out5.txt &
octave --silent --eval "A5" > out6.txt &
octave --silent --eval "A5" > out7.txt &
octave --silent --eval "A5" > out8.txt &
octave --silent --eval "A5" > out9.txt &
octave --silent --eval "A5" > out10.txt &
octave --silent --eval "A5" > out11.txt &
octave --silent --eval "A5" > out12.txt &
octave --silent --eval "A5" > out13.txt &
octave --silent --eval "A5" > out14.txt &
octave --silent --eval "A5" > out15.txt &
octave --silent --eval "A5" > out16.txt &

alldone="no"
while [ "$alldone" = "no" ]; do
    echo "Checking if all files exist."
    if [[ -e out1.txt && -e out2.txt && -e out3.txt && -e out4.txt && -e out5.txt && -e out6.txt && -e out7.txt && -e out8.txt && -e out9.txt && -e out10.txt && -e out11.txt && -e out12.txt && -e out13.txt && -e out14.txt && -e out15.txt && -e out16.txt ]]; then
	echo "All files exist.  Concatenating into out.txt"
	cat out1.txt out2.txt out3.txt out4.txt out5.txt out6.txt out7.txt out8.txt out9.txt out10.txt out11.txt out12.txt out13.txt out14.txt out15.txt out16.txt > out.txt
	alldone="yes"
    fi
    #sleep 1
done
y=`date +"%N"`
runtime=$((y-x));
echo $runtime >> parallel.txt
