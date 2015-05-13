# AOSC675
AOSC 675 Model Project Spring 2015

Doyeon Ahn, Cory Martin & Sandra Roberts

driver.f08 - Driver for Model

insol.f08 - Insolation Module

temp.f08 - Surface Temperature Module

photo.f08 - Photosynthesis Module

resp.f08 - Respiration Module

input.f08 - Namelist input Module



Namelist parameters:

lat = 39 ! latitude of point of interest

SolConst = 1370 ! w/m^2 - solar constant

numyears = 2 ! number of years to run model

mon_precip = 10 ! average monthly precip in centimeters

Tsurf = 255 ! initial surface temp at model init

CapHeat = 4187000. ! Heat capacity of the Earth's surface (JK^-1m^-2)

veg_type = 1 ! vegetation type integer, see README for values

  1 - Grassland

  2 - Temperate Evergreen Seasonal/Broadleaf

  3 - Evergreen Needle Leaf
  
  4 - Tropical Rainforest
