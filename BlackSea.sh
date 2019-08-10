#!/bin/bash
gmt set FORMAT_GEO_MAP F
set region = 5/45/40/58
#gmt grdcut -Gblackseadgrid.grd -R5/45/40/58 GEBCO_2019.nc

gmt makecpt -Crelief -T-3000/3000/1 > color_BS.cpt
#gmt makecpt -Cgebco > color_BS.cpt
gmt grdgradient blackseadgrid.grd -Ne0.8 -A0 -Gbsgrad.nc
gmt grdimage blackseadgrid.grd -R8/45/40/55 -JM15 -K -Ccolor_BS.cpt -Ibsgrad.nc > osmap.ps

gmt psbasemap -B10g0/5g0 -R8/45/40/55 -JM15 -O -K -V -Lfx10/8c/10/1000km+l"km">> osmap.ps
gmt psxy corecoords -JM15 -R8/45/40/55 -K -O -Sc0.25 -Gred >> osmap.ps
gmt pscoast -JM15 -R8/45/40/55 -K -O -I0/0.3,blue -I1/0.3,blue -I2/0.3,blue -I3/0.3,blue >>osmap.ps
gmt pstext corecoords -JM15 -R8/45/40/55 -O -Dj0.015c/0.15c -F+jTL+f14p,Helvetica,red >> osmap.ps
#gmt psscale -D10/8/10/2 -Ccolor_BS.cpt -O -B1:"Height": >> osmap.ps 

ps2pdf osmap.ps map.pdf
okular map.pdf
