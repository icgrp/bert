IDIR =../../embedded/src/bert
CC=gcc
CFLAGS=-I$(IDIR) -D HOST_SIDE -D DISABLE_ACCEL -g

ODIR=.
LDIR =../../embedded/src/bert


_DEPS = dummy_xilinx.h mydesign.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = dummy_xilinx.o mydesign.o bitstream_gen.o $(LDIR)/bert.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


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