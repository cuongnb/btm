CC = g++
CFLAGS =-g -std=c++11 -pipe -O3

LSOURCE = main.cpp obtm.cpp ibtm.cpp infer.cpp
LHEADER = biterm.h doc.h ibtm.h infer.h obtm.h pmat.h pvec.h sampler.h str_util.h

linux: $(LSOURCE) $(HEADER)
	  $(CC) -L$(CFLAGS) $(LSOURCE) -o btm-condor

linux-d: $(LSOURCE) $(HEADER)
	  $(CC) -g -L$(CFLAGS) $(LSOURCE) -o btm-condor

clean:
	-rm -f btm
clean-d:
	-rm -f btm