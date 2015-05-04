FC = gfortran
## we don't need netcdf for this I guess
#FFLAGS = $(shell nc-config --fflags) -O
#FLIBS = $(shell nc-config --flibs)
FFLAGS = -O3

all:	model.exe

clean:

	rm -f *.o *.mod model.exe

#dependencies
model.exe: driver.o insol.o temp.o photo.o resp.o
	$(FC)  -o $@ $^ $(FLIBS)

driver.o: insol.o temp.o photo.o resp.o


#compile rules
%.o : %.f08
	$(FC) ${FFLAGS} -c $<
