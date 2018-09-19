INPUT=$1

cat $INPUT | while read line
do
	infile=`echo "$line" | awk -F"	" '{print $1}'`
	outfile=`echo "$line" | awk -F"	" '{print $2}'`
	echo "specsub('$infile','$outfile')" > comando_"$INPUT".m
	octave comando_"$INPUT".m
done
rm comando_"$INPUT".m

