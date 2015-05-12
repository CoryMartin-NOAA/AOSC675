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

  !!!!!!! DEFINE EXPLICITLY INPUT VARIABLES/PARAMS HERE !!!!!!

contains
  subroutine read_nml()
    ! Read in parameters from a namelist (./namelist)
    implicit none
    !namelist /domain/ dx,dy,dz,x1,x2,y1,y2,z1,z2
    !namelist /time/ dt,t1,t2
    !namelist /io/ outfile,outint
    !namelist /phys/ d,difz
    open(99, file='namelist')	! open './namelist'
    !read(99, nml=domain)
    !rewind(99)
    !read(99, nml=time)
    !rewind(99)
    !read(99, nml=io)
    !rewind(99)
    !read(99, nml=phys)
    !rewind(99)
    close(99)
    end subroutine
end module
