!--------------------------------------------------------------------
! AOSC 675 Final Project
!--------------------------------------------------------------------
!
! PROGRAM: Driver
!
!> @author
!> Doyeon Ahn, Cory Martin & Sandra Roberts
!
! DESCRIPTION:
!> Driver for simple plant photosynthesis and soil respiration model.
!
! REVISION HISTORY:
! Apr 2015 - Initial Version
!--------------------------------------------------------------------
program driver
  use insol
  use temp
  use resp
  use photo
  use input
implicit none

integer :: t
real :: S_total, Tsurf
integer :: numyears = 10 ! number of years to run model
real :: mon_precip = 10 ! monthly precipitation in centimeters

print *,"Now reading parameters from ./namelist..."
call read_nml() ! read namelist

open (unit=98,file="model_output.txt",action="write",status="replace")

Tsurf = 255   ! assume start temperature of 255K

print *,"Running Model Now..."
do t=1,8760*numyears ! number of hours, 2 years test
  print *,t ! print timestep
  call calc_insol(t,S_total) ! calculate insolation
  call calc_temp(Tsurf,S_total,Tsurf) ! calculate surface temperature
  print *,S_total, Tsurf  ! print to screen, for testing purposes
  write (98,*) t, S_total, Tsurf  ! write variables to file
enddo
print *,"Model Finished!"

end program
