noiseDIR=$1
speechDIR=$2

find $noiseDIR -name "noise_*.flac" > noise.list
find $speechDIR -name "F*.WAV" > speech.list

for snr in -20 -10 -5 0 5 10 20 1000
do
	for noiseNumber in `seq 1 3`
	do
		for stretchNumber in `seq 1 5`
		do
			pathFile=`echo "database/snr$snr/noise0$noiseNumber/stretch0$stretchNumber"`
			mkdir -p `echo $pathFile`
			cat speech.list | while read line
			do
				echo "$snr + $line + Ruido $noiseNumber + Trecho $stretchNumber ..."
				fileName=`echo $line | sed 's|/|\n|g' | tail -n 1`	
				outputFile=`echo "$pathFile/$fileName"`
				cat addNoiseScript.template | sed "s|noiseDIR|$noiseDIR|g" | sed "s|noiseNumber|$noiseNumber|g" | sed "s|stretchNumber|$stretchNumber|g" | sed "s|speechFILE|$line|g" | sed "s|SNR|$snr|g" | sed "s|OUTPUTFILE|$outputFile|g" > addNoiseScript.m
				octave addNoiseScript.m
				rm -rf addNoiseScript.m
				#touch $pathFile/$fileName
			done
		done	
	done
done
