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
  use init
  use insol
implicit none

integer :: t
real :: S_total

open (unit=99,file="results.txt",action="write",status="replace")

print *,"Hello World"
do t=1,8760*2 ! 2 years test
  print *,t
  call calc_insol(t,S_total)
  print *,S_total
  write (99,*) t, S_total
enddo


end program
