#!/usr/bin/env bash

# updated for 2024

#isbig=false means background  5641x3650, moon image = 3840x2160, download ~ 5MB
#isbig=true means background  8192x5641, moon image = 5760x3240, download ~ 12MB
isbig=false

#go into directory of script no matter where it is called.
wdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $wdir

#get current hour of the year
num=$((10#$(date --utc +"%j")*24-23+10#$(date --utc +"%H")))
echo "Hour of Year: "$num
#get phase/illumination% from text file edited from "https://svs.gsfc.nasa.gov/vis/a000000/a005100/a005187/mooninfo_2024.txt"
phase=$(sed "$num q;d" phase.txt)
echo "Phase: "$phase
#age: days in moon cycle so far
age=$(sed "$num q;d" age.txt)
echo "Age: "$age
#caption
text="Phase: $phase% Days: $age     "

# filename for dowloaded image
im="moon.$(printf "%04d" $num).tif" 

echo "Insert: "$text
echo "File to download: "$im

#URLs updated for 2024
if [ $isbig = true ]
then
	curl -LO "https://svs.gsfc.nasa.gov/vis/a000000/a005100/a005187/frames/5760x3240_16x9_30p/plain/$im"	#2024

	wait
	#replace orginal file with designated background file and add background and caption with imagemagick
	composite -gravity center $im best.tif back.tif 
	convert -font ubuntu -fill '#b1ada7' -pointsize 80 -gravity east -draw "text 150,1800 '$text'" back.tif back.tif
else
	curl -LO "https://svs.gsfc.nasa.gov/vis/a000000/a005100/a005187/frames/3840x2160_16x9_30p/plain/$im"	# 2024

	wait
	#replace orginal file with designated background file and add background and caption with imagemagick 
	composite -gravity center $im best_small.tif back.tif
	convert -font ubuntu -fill '#b1ada7' -pointsize 50 -gravity east -draw "text 100,1200 '$text'" back.tif back.tif
fi
echo $wdir

#first half of gsettings command forces background to reload, by assigning an empty picture and immediately replacing it with the updated back.tif file.
gsettings set  org.cinnamon.desktop.background picture-uri "" && gsettings set  org.cinnamon.desktop.background picture-uri "file://$wdir/back.tif"

#remove downloaded moon file as not too use up storage.
rm $im
