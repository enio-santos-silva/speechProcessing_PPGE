DIRIN=$1

mkdir ruidos
ls $DIRIN/*.flac | while read line
do
	nome=`echo $line | sed "s|/|\n|g" | tail -n 1`
	sox -r 44100 $line -r 11025 -c 1 ruidos/$nome
done


