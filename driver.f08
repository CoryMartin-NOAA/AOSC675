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
implicit none

integer :: t
real :: S_total, Tsurf
integer :: numyears = 10 ! number of years to run model

open (unit=99,file="results.txt",action="write",status="replace")

Tsurf = 255   ! assume start temperature of 255K

print *,"Running Model Now..."
do t=1,8760*numyears ! number of hours, 2 years test
  print *,t
  call calc_insol(t,S_total)
  call calc_temp(Tsurf,S_total,Tsurf)
  print *,S_total, Tsurf
  write (99,*) t, S_total, Tsurf
enddo
print *,"Model Finished!"

end program
