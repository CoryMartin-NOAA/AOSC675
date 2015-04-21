!--------------------------------------------------------------------
! AOSC 675 Final Project
!--------------------------------------------------------------------
!
! module: temp
!
!> @author
!> Cory Martin
!
! DESCRIPTION:
!> calculates temperature based off of insolation and previous temp
!
! REVISION HISTORY:
! Apr 2015 - Initial Version
!--------------------------------------------------------------------
module temp
  implicit none
  real, parameter :: CapHeat = 4187000. ! Heat capacity of the Earth's surface (JK^-1m^-2) (assuming water)
  real :: sigma = 5.670E-8      ! Stefan-Boltzmann Constant (Wm^-2K^-4)
  real :: Secs = 3600.           ! number of seconds in each model timestep

contains
  subroutine calc_temp(Tin,S,Tout)
    real, intent(in) :: Tin, S   ! current temperature, and incoming solar
    real, intent(out) :: Tout    ! new temperature
    real :: IR                ! outgoing longwave radiation
    IR = sigma*Tin**4         ! calculate longwave radiation at this temperature
    Tout = Tin + (S-IR)*Secs/CapHeat  ! attempt at calculating temperature

  end subroutine
end module
