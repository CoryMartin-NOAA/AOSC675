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
real :: S_total, GPP,Ra,NPP

print *,"Now reading parameters from ./namelist..."
call read_nml() ! read namelist

open (unit=98,file="model_output.txt",action="write",status="replace")

print *,"Running Model Now..."
do t=1,8760*numyears ! number of hours, 2 years test
  print *,t ! print timestep
  call calc_insol(t,S_total) ! calculate insolation
  call calc_temp(Tsurf,S_total,Tsurf) ! calculate surface temperature
  call calc_photo(S_total,Tsurf,GPP)
  call calc_resp(GPP,Tsurf,Ra) ! calculate respiration
  NPP = GPP-Ra
  print *,S_total, Tsurf, GPP, Ra, NPP  ! print to screen, for testing purposes
  write (98,*) t, S_total, Tsurf, GPP, Ra, NPP ! write variables to file
enddo
print *,"Model Finished!"

end program
