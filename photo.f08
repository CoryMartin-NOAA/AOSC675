!--------------------------------------------------------------------
! AOSC 675 Final Project
!--------------------------------------------------------------------
!
! module: photo
!
!> @authors
!> Cory Martin, Sandra Roberts
!
! DESCRIPTION:
!> Module for calculating Photosynthesis
!
! REVISION HISTORY:
! May 2015 - Initial Version
!--------------------------------------------------------------------
module photo
  use input
  implicit none
contains
subroutine calc_photo(S_total, GPP)
  implicit none
  real, intent(in) :: S_total
  real, intent(out) :: GPP
  real :: amax = 0.95
  real :: a = -0.025
  real :: b = 1.25
  real :: act_rad = 0.48
  real :: photo_e, NDIV,absorb_e !we have to let the user choose and do an if type statement to determine photo_e and NDIV
  
  photo_e = ??
  NDIV = ??
  
  absorb_e = amax*(a+b*NDIV)
  GPP = photo_e*absorb_e*act_rad*S_total

end module
