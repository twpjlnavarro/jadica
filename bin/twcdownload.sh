#!/bin/bash 

#----------------------------------------------------------------------------------
#-- Download TWC datafiles
#----------------------------------------------------------------------------------

echo $(date +"%T") $0 starting...

function usage() { 
	echo "Usage: $0 -d YYYYmmdd -h {00,06,12,18} -x lon -y lat" 
			1>&2; exit 1; }
			
apiKey="96deeadd2d9f4a339eeadd2d9fda3321"
language=es-ES
units=m
format=json
forecast=hourly
apiName=2day


while getopts "d:h:x:y:" OPTION; do
	case $OPTION in
		d) #- download run day in format $(date +"%Y%m%d")
			stamp=$OPTARG ;;
		h) #- download run hour in {00, 06, 12, 18}
			hh=$OPTARG ;;
		x) #- longitude
			lon=$(printf %.4f $OPTARG) ;;
		y) #- latitude
			lat=$(printf %.4f $OPTARG) ;;
		*) usage ;;
	esac
done


curl --silent \
     --disable-epsv \
      --create-dirs \
	 --connect-timeout 30  \
	 -m 3600 \
	 -o ~/data/twc/${stamp}/${hh}/${apiName}-x[${lon}]-y[${lat}].${format} \
	 "https://api.weather.com/v3/wx/forecast/${forecast}/${apiName}?geocode=${lat},${lon}&format=${format}&units=${units}&language=${language}&apiKey=${apiKey}"

chmod -R a+rwx ~/data/twc/${stamp}/${hh}	 


echo $(date +"%T") $0 finished!