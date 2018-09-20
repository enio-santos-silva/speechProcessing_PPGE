INPUT=$1

cat $INPUT | while read line
do
	infile=`echo "$line" | awk -F"	" '{print $1}'`
	outfile=`echo "$line" | awk -F"	" '{print $2}'`
	echo "pkg load signal" > comando_"$INPUT".m
	echo "logmmse('$infile','$outfile')" >> comando_"$INPUT".m
	octave comando_"$INPUT".m
done
rm comando_"$INPUT".m

