DATABASE=/home/enio/speechProcessing/marcio/livro_e_cd/databases/trabalho01/Ruído_04


clean:
	rm -rf resample ruidos

resample: 
	./make-resample.sh $(DATABASE)
	touch $@
