# The name of the .bit, .mdd, and .ll files in this directory
DESIGNNAME=top

# Use aarch64-linux-gnu-gcc for petalinux build
CC=gcc



IDIR =../../embedded/src/bert
CFLAGS=-I$(IDIR) -D HOST_SIDE -D DISABLE_ACCEL -g

ODIR=.
LDIR =../../embedded/src/bert


_DEPS = dummy_xilinx.h mydesign.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = dummy_xilinx.o mydesign.o bitstream_gen.o $(LDIR)/bert.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(DESIGNNAME).ll:
	echo "Place $(DESIGNNAME).ll in this directory!"

$(DESIGNNAME).mdd:
	echo "Place $(DESIGNNAME).mdd in this directory!"

$(DESIGNNAME).bit:
	echo "Place $(DESIGNNAME).bit in this directory!"

../../host_tools/bert_gen/$(DESIGNNAME)_src:
	mkdir ../../host_tools/bert_gen/$(DESIGNNAME)_src

mydesign.c: $(DESIGNNAME).ll $(DESIGNNAME).mdd $(DESIGNNAME).bit | ../../host_tools/bert_gen/$(DESIGNNAME)_src
	cp $(DESIGNNAME).ll $(DESIGNNAME).mdd $(DESIGNNAME).bit ../../host_tools/bert_gen/$(DESIGNNAME)_src
	cd ../../host_tools/bert_gen; cmake CMakeLists.txt
	+$(MAKE) -C ../../host_tools/bert_gen
	cd ../../host_tools/bert_gen; ./gen.sh -gen $(DESIGNNAME)_src
	cp ../../host_tools/bert_gen/$(DESIGNNAME)_src/mydesign.c mydesign.c
	cp ../../host_tools/bert_gen/$(DESIGNNAME)_src/mydesign.h mydesign.h


$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

bitstream_gen: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~
	rm -f $(LDIR)/*.o
	rm -f test.bit
	rm -f bitstream_gen
	rm -f mydesign.c
	rm -f mydesign.h