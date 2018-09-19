clear; clc
noiseFile ='/home/enio/speechProcessing/marcio/experimentos/noiseSegmentation/noise_03_05.flac';
cleanFile='/home/enio/speechProcessing/marcio/livro_e_cd/databases/trabalho01/Fala_04/F180904.WAV';

[s,fs] = audioread(cleanFile);
[sn, fsn] = audioread(noiseFile);

addpath('/home/enio/Downloads/voicebox')
[z,p,fso]=v_addnoise(s,fs,1e10,'d',sn,fsn);
sz = z/max(abs(z));
audiowrite('database/snr1000/noise03/stretch05/F180904AQUIIIIIIIII.WAV',sz,fs)
