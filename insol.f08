!--------------------------------------------------------------------
! AOSC 675 Final Project
!--------------------------------------------------------------------
!
! module: insol
!
!> @author
!> Cory Martin
!
! DESCRIPTION:
!> calculates incoming solar radation based off of timestep
!> assumes step of one hour and that model starts at 00Z Jan 1
!
! REVISION HISTORY:
! Apr 2015 - Initial Version
!--------------------------------------------------------------------
module insol
  use init
  implicit none
  int :: SolConst = 1370 ! w/m^2
