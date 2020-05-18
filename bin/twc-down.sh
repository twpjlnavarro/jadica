#!/bin/bash

dd=$(date +"%d")
mm=$(date +"%m")
yy=$(date +"%Y")
hh=$(date +"%H")
day=$yy$mm$dd
export HOMEPROJ=~/jadica
DATADIR=~/data/twc/${day}/${hh}

cd $HOMEPROJ/bin

rm -f $HOMEPROJ/latest
ln -s $DATADIR $HOMEPROJ/latest
while read id lon lat; do
	./twcdownload.sh -d $day -h ${hh} -x ${lon} -y ${lat}
done <<EOF
1 -70.2774872 18.4165969
2 -70.3798708 18.3745559
3 -70.340666 18.4651635
4 -70.4082042 18.4934173
5 -70.4668276 18.6016219
6 -70.3883798 18.7032604
7 -70.4658735 18.7198033
8 -68.6736838 18.7198629
9 -69.3148935 18.8502261
10 -70.2258263 18.484975
11 -70.274309 18.5232966
12 -70.8694282 18.7215328
13 -71.7322731 18.7076301
14 -71.0048691 18.8521671
15 -70.7232387 18.6165671
16 -71.7010615 18.1863089
17 -71.2389435 17.9577994
18 -71.1499298 18.0732476
19 -71.2381243 18.085306
20 -71.4563996 18.5815186
21 -71.6536794 18.6299302
22 -70.8069744 19.197175
23 -70.8873988 19.2113569
24 -70.9184684 19.1493102
25 -70.6239701 19.5479658
26 -70.451154 19.4591717
27 -70.5486142 18.8818264
28 -70.8019041 19.1152608
29 -70.7717497 19.041977
30 -70.5828789 18.9780907
31 -70.6051892 19.2325109
32 -71.46333 19.2865913
33 -71.2806748 19.2951767
34 -70.9307614 19.6663988
35 -71.6751994 19.3487557
36 -71.6089656 19.3392733
37 -71.5325398 19.248925
38 -70.3952814 19.4441618
39 -70.310089 19.003557
40 -71.159135 19.763416
EOF
