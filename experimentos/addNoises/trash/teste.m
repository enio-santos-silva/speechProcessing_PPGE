clear; clc

noiseFile ='/home/enio/speechProcessing/marcio/experimentos/preProcessing/ruidos/MIXER_HAND_ELECTRIC-VE_1-2.flac'
cleanFile='/home/enio/speechProcessing/marcio/livro_e_cd/databases/trabalho01/Fala_04/F180902.WAV'

[s,fs] = audioread(cleanFile);
[sn, fsn] = audioread(noiseFile);

addpath('/home/enio/Downloads/voicebox')
[z,p,fso]=v_addnoise(s,fs,30,'d',sn,fsn);
sz = z/max(abs(z));
audiowrite('saida.wav',sz,fs)