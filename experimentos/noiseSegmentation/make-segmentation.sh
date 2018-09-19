
## Ruido 01
sox MIXER_HAND_ELECTRIC-VE_1-2.flac noise_01_01.flac trim 0.405248 5
sox MIXER_HAND_ELECTRIC-VE_1-2.flac noise_01_02.flac trim 6.174359 5
#sox MIXER_HAND_ELECTRIC-VE_1-2.flac noise_01_03.flac trim 22.124937 5
#sox MIXER_HAND_ELECTRIC-VE_1-2.flac noise_01_04.flac trim 41.763033 5
#sox MIXER_HAND_ELECTRIC-VE_1-2.flac noise_01_05.flac trim 49.301991 5
sox MIXER_HAND_ELECTRIC-VE_1-2.flac noise_01_03.flac trim 59.584014 5
#sox MIXER_HAND_ELECTRIC-VE_1-2.flac noise_01_07.flac trim 67.717480 5
sox MIXER_HAND_ELECTRIC-VE_1-2.flac noise_01_04.flac trim 73.957869 5
#sox MIXER_HAND_ELECTRIC-VE_1-2.flac noise_01_09.flac trim 80.403401 5
sox MIXER_HAND_ELECTRIC-VE_1-2.flac noise_01_05.flac trim 90.878450 5

## Ruido 02
sox MIXER_HAND_MANUAL-mi#10CFB.flac noise_02_01.flac trim 1.136162 5
sox MIXER_HAND_MANUAL-mi#10CFB.flac noise_02_02.flac trim 7.968839 5
sox MIXER_HAND_MANUAL-mi#10CFB.flac noise_02_03.flac trim 16.251809 5
sox MIXER_HAND_MANUAL-mi#10CFB.flac noise_02_04.flac trim 24.520372 5
sox MIXER_HAND_MANUAL-mi#10CFB.flac noise_02_05.flac trim 29.713176 5

## Ruido 03
s=0.743584
e=13.664630
d=`echo "scale=6;$e-$s" | bc`
#awk -v min=$s -v max=$e 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'
echo "$s+rand()*$d" > temp.m

for i in 1 2 3 4 5
do
octave temp.m > temp.num
start=`sed 's/ /\n/g' temp.num | tail -n 1`
sox MIX_MASTER-start-run-stop.flac noise_03_0$i.flac trim $start 5
done
rm temp.*
