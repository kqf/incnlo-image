FROM cern/slc6-base

RUN yum install -y gcc-gfortran
RUN yum install -y cernlib cernlib-devel cernlib-static

RUN ln -s gfortran /usr/bin/g77

ADD incnlo /incnlo
WORKDIR incnlo

RUN make -f Makefile_home
RUN make working

WORKDIR /incnlo/working/
RUN mkdir -p /output
RUN ls
