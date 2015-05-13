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
lat = 39 ! latitude of point of interest\n
SolConst = 1370 ! w/m^2 - solar constant\n
numyears = 2 ! number of years to run model\n
mon_precip = 10 ! average monthly precip in centimeters\n
Tsurf = 255 ! initial surface temp at model init\n
CapHeat = 4187000. ! Heat capacity of the Earth's surface (JK^-1m^-2)\n
veg_type = 1 ! vegetation type integer, see README for values\n
  1 - Grassland\n
  2 - Temperate Evergreen Seasonal/Broadleaf\n
  3 - Evergreen Needle Leaf\n
  4 - Tropical Rainforest\n
