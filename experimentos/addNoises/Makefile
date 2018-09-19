NOISEDIR=/home/enio/speechProcessing/marcio/experimentos/noiseSegmentation
SPEECHDIR=/home/enio/speechProcessing/marcio/livro_e_cd/databases/trabalho01/Fala_04

all:: addNoise

clean:
	rm -rf database *.list addNoise

addNoise:
	./make-addNoise.sh $(NOISEDIR) $(SPEECHDIR)
	touch $@
