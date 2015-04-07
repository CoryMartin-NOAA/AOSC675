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
model.exe: init.o driver.o insol.o
	$(FC)  -o $@ $^ $(FLIBS)

driver.o: init.o insol.o

insol.o: init.o


#compile rules
%.o : %.f08
	$(FC) ${FFLAGS} -c $<
