import numpy as np
import netCDF4 as nc4
w='wrfout_d01_0001-01-01_00:00:00'

d = nc4.Dataset(w)

fxlon = np.array(d.variables['FXLONG'])
fxlat = np.array(d.variables['FXLAT'])
xlon = np.array(d.variables['XLONG'])
xlat = np.array(d.variables['XLAT'])

print(fxlon.shape)
print(fxlat.shape)
print(xlon.shape)
print(xlat.shape)
