# filtro las estaciones de Madrid
cat estaciones/AirBase_v8_stations.csv | grep -i madrid > estaciones/AirBase_v8_stations.madrid.csv

# exporto las estaciones de Madrid a un array de Shell Script
awk -F "\t" '{print "estaciones["$2"]=\"" $13 "_" $14 "\""}' estaciones/AirBase_v8_stations.madrid.csv > estaciones/estaciones-madrid-toarray.txt
