.PHONY: all


all: Dockerfile incnlo
	docker build -t incnlo .

incnlo: inc1_4.tar.gz
	curl -O https://lapth.cnrs.fr/PHOX_FAMILY/src_inc/inc1_4.tar.gz
	tar xzvf inc1_4.tar.gz
	rm inc1_4.tar.gz

	@# Move it to version agnostic folder
	mv inc1_4 incnlo

	@# Apply patches to fix g77 -> gfortran transition
	sed -i -- 's/TYPE=/STATUS=/g' incnlo/merged/src/onestru.f
	sed -i -- 's/NAME=/FILE=/g' incnlo/merged/src/onestru.f

	@# Change the default path to the CERNlib
	sed -i -- 's#-L/cern/pro/lib#-L/usr/lib64/cernlib/2006/lib/#g' incnlo/merged/src/Makefile*
