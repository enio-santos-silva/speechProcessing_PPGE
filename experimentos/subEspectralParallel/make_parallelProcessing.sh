INPUT=$1

cores=`cat /proc/cpuinfo | grep "processor"  | wc -l`
linhas=`cat input_files.list | wc -l`
n=`echo "scale=0;$linhas/$cores" | bc`
split -d -l $n $INPUT

for i in `ls x*`
do
	echo "Processing $i ..."
	nohup ./make_processing.sh $i &
done

