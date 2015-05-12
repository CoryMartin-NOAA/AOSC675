!--------------------------------------------------------------------
! AOSC 675 Final Project
!--------------------------------------------------------------------
!
! module: input
!
!> @author
!> Cory Martin
!
! DESCRIPTION:
!> Gets parameters from namelist so model doesn't require recompiling
!
! REVISION HISTORY:
! May 2015 - Initial Version
!--------------------------------------------------------------------
module input

  real :: lat, SolConst
  integer :: numyears
  real :: mon_precip, Tsurf, CapHeat

contains
  subroutine read_nml()
    ! Read in parameters from a namelist (./namelist)
    implicit none
    namelist /params/ lat, SolConst, numyears, mon_precip, Tsurf, CapHeat
    open(99, file='namelist')	! open './namelist'
    read(99, nml=params)
    close(99)
    end subroutine
end module
