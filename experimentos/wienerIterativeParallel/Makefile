#!/bin/bash

DATABASE='/home/enio/speechProcessing/marcio/experimentos/addNoises/database'
#DATABASE='/home/enio/speechProcessing/marcio/livro_e_cd/databases/speech/NOIZEUS/'
#DATABASE='/home/enio/speechProcessing/marcio/livro_e_cd/databases/noise_recordings/'
#DIR_IN='/home/enio/speechProcessing/marcio/livro_e_cd/databases/speech/NOIZEUS/airport/0dB'



all:: processing

clean:
	rm -rf *.list lists processing processingfiles x*
	clear

lists:
	./make_lists_and_foler.sh $(DATABASE)
	touch $@

processing: lists
	./make_parallelProcessing.sh input_files.list
	touch $@

