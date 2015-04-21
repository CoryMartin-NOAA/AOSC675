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
  implicit none
  ! remove below line later
  real :: lat = 39
  integer :: SolConst = 1370 ! w/m^2 average solar constant
  integer :: len_day = 24 ! assumes 24 timesteps (each is one hour in this model)
  integer :: len_year = 8760 ! assumes 8760 hours/timesteps in a year
  real :: F_solar ! incoming solar flux
  real :: pi

contains
  subroutine calc_insol(t,S_total)
    implicit none
    integer, intent(in) :: t
    real, intent(out) :: S_total
    !S_orbit = 50*cos((2*pi/365)*t) + 1370 ! calculate the annual solar cycle
    !!!!!! the code below is modified from / based off of calculations from
    !!!!!! the SPEEDY model
    real :: frac_year,clat,slat,alpha
    real :: ca1,sa1,ca2,sa2,ca3,sa3,decl,fdis,cdecl,sdecl,tdecl
    real :: csolp,ch0,h0,sh0,S_ave

    pi = 4.*atan(1.)
    ! compute declination angle and Earth-Sun distance factor
    frac_year = t/8760. ! fraction of year
    alpha = 2.*pi*frac_year
    clat = cos(lat*pi/180.)
    slat = sin(lat*pi/180.)
    ca1 = cos(alpha)
    sa1 = sin(alpha)
    ca2 = ca1*ca1-sa1*sa1
    sa2 = 2.*sa1*ca1
    ca3 = ca1*ca2-sa1*sa2
    sa3 = sa1*ca2+sa2*ca1
    decl = 0.006918-0.399912*ca1+0.070257*sa1-0.006758*ca2+0.000907*sa2-0.002697*ca3+0.001480*sa3
    fdis = 1.000110+0.034221*ca1+0.001280*sa1+0.000719*ca2+0.000077*sa2
    cdecl = cos(decl)
    sdecl = sin(decl)
    tdecl = sdecl/cdecl
    ! compute daily-average insolation at the top of the atmosphere
    csolp = SolConst/pi
    ch0 = min(1.,max(-1.,-tdecl*slat/clat))
    h0 = acos(ch0)
    sh0 = sin(h0)
    S_ave = csolp*fdis*(h0*slat*sdecl+sh0*clat*cdecl)
    !!!! SPEEDY model only does daily average, but I want diurnal cycle too
    !!!! code for diurnal variation below
    !! NOTE: Only going to assume a ~12 hour day, regardless of season.
    !! will still show seasonal variability
    S_total = S_ave + (S_ave)*sin((2*pi/24)*t)
    if (S_total < 0) then
      S_total = 0
    endif

    return
  end subroutine
end module
