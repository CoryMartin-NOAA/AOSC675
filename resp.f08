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
  real :: maint_coef_in, maint_coef, dry_weight !we have to let the user choose and do an if type statement to determine these variables

  IF (veg_type == 1) THEN
      ! coefficient values for X vegetation type
      maint_coef =
      dry_weight =
      maint_coef_in =
  ELSE IF (veg_type == 2 ) THEN
    ! coefficient values for X vegetation type
  ELSE IF (veg_type == 3 ) THEN
    ! coefficient values for X vegetation type
  ElSE IF (veg_type == 4 ) THEN
    ! coefficient values for X vegetation type
  ELSE
     ! do nothing?
  END IF

  dry_weight = ?? !Plant dependent, user input
  maint_coef_in = ?? !Plant dependent, user input
  maint_coef = maint_coef_in*(1+0.16*T)

  Ra = maint_coef*dry_weight + grow_coef*GPP

  return

end subroutine


end module
