FC = gfortran
FFLAGS = $(shell nc-config --fflags) -O
FLIBS = $(shell nc-config --flibs)
#FC = gfortran
#FFLAGS = -g -O2 -I/usr/include -O
#FLIBS = -L/usr/lib -lnetcdff -lnetcdf

all:	model.exe

clean:

	rm -f *.o *.mod model.exe

#dependencies
model.exe: driver.o insol.o temp.o
	$(FC)  -o $@ $^ $(FLIBS)

driver.o: insol.o temp.o


#compile rules
%.o : %.f08
	$(FC) ${FFLAGS} -c $<
