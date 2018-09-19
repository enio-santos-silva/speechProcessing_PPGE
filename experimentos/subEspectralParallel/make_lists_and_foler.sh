DATABASE=$1

find $DATABASE -iname "*.wav" > wav_test.list
cat wav_test.list | sed 's|database|\n./processingfiles|g' | grep -i ".wav" > out_file.list

rm -rf tmp.txt
cat out_file.list | while read line
do
	nome=`echo "$line" | sed 's|/|\n|g' | tail -n 1`
	echo "$line" | sed "s|$nome||g" >> tmp.txt
done
mkdir -p `cat tmp.txt | sort -u`
rm -rf tmp.txt

paste wav_test.list out_file.list > input_files.list

