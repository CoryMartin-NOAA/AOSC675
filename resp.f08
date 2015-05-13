!--------------------------------------------------------------------
! AOSC 675 Final Project
!--------------------------------------------------------------------
!
! module: resp
!
!> @authors
!> Cory Martin, Sandra Roberts
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
      ! coefficient values for Grassland vegetation type
    dry_weight = 900 ! gC/m^2
    maint_coef_in = 0.367 ! mg/g/hour
  ELSE IF (veg_type == 2 ) THEN
    ! coefficient values for Temperate Evergreen Seasonal/Broadleaf vegetation type
    dry_weight = 9900 ! gC/m^2
    maint_coef_in = 5.625 ! mg/g/hour
  ELSE IF (veg_type == 3 ) THEN
    ! coefficient values for Evergreen Needle Leaf vegetation type
    dry_weight = 13500 ! gC/m^2
    maint_coef_in = 0.744 !mg/g/hour
  ElSE IF (veg_type == 4 ) THEN
    ! coefficient values for Tropical Rainforest vegetation type
    dry_weight = 20250 ! gC/m^2
    maint_coef_in = 1.29 ! mg/g/hour
  ELSE
     ! do nothing?
  END IF

  maint_coef = maint_coef_in*(1+0.16*(T-273))

  IF (maint_coef < 0. ) THEN
    maint_coef = 0
  END IF

  Ra = maint_coef*dry_weight + grow_coef*GPP

  return

end subroutine


end module
