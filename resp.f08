!--------------------------------------------------------------------
! AOSC 675 Final Project
!--------------------------------------------------------------------
!
! module: resp
!
!> @authors
!> Cory Martin
!
! DESCRIPTION:
!> Module for calculating Respiration
!
! REVISION HISTORY:
! May 2015 - Initial Version
!--------------------------------------------------------------------
module resp
  use input
  implicit none
contains
 subroutine calc_resp(GPP, T, Ra) !Probably to include information from user input as well...
  implicit none
  real, intent(in) :: GPP,T
  real, intent(out) :: Ra
  real :: grow_coef = 0.14
  real :: maint_coef_in, maint_coef, dry_weight !we have to let the user choose and do an if type statement to determine photo_e and NDIV
  
  dry_weight = ?? !Plant dependent, user input
  maint_coef_in = ?? !Plant dependent, user input
  maint_coef = maint_coef_in*(1+0.16*T)
  
  Ra = maint_coef*dry_weight + grow_coef*GPP
  
  return

end subroutine
  
  
end module
