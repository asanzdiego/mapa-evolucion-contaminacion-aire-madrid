# Mapa de la evolución de la contaminación del aire de Madrid

Del 12 al 14 de septiembre de 2014, se desarrolló el [#hack4good de Geeklist](https://geekli.st/hackathon/hack4good-06/), un hackathon global contra el cambio climático, que aquí [en Madrid lo organizamos](http://www.meetup.com/Hackathon-Lovers/events/201739262/) la gente de [Hackathon Lovers](http://hackathonlovers.com/) junto con la gente de [KUNlabori](http://www.kunlabori.es/), y cuyo patrocinador principal fue [CartoDB](http://cartodb.com/).

A mi se me ocurrió hacer un mapa con la evolución de la contaminación del aire de Madrid. Y conseguí realizar un [mapa de la evolución del dióxido de Nitrógeno en Madrid](https://asanzdiego.cartodb.com/viz/d79daa7c-3c19-11e4-8081-0edbca4b5057/), que creo que ha quedado bastante chulo.

![Mapa de la evolución del dióxido de Nitrógeno en Madrid](./img/cartodb-00-visualizacion.png)

# ¿Cómo lo he hecho?

## Búsqueda de datos

Lo primero fue buscar un conjunto de datos sobre la contaminación del aire en Madrid.

Lo encontré en la [página web de datos abiertos del Ayuntamiento de Madrid](http://datos.madrid.es/), exactamente en el apartado sobre [calidad del aire con los datos desde el 2003 al 2014](http://datos.madrid.es/portal/site/egob/menuitem.c05c1f754a33a9fbe4b2e4b284f1a5a0/?vgnextoid=aecb88a7e2b73410VgnVCM2000000c205a0aRCRD&vgnextchannel=374512b9ace9f310VgnVCM100000171f5a0aRCRD).

Desde el último enlace descargué todos los datos que están en la [carpeta datos](https://github.com/asanzdiego/mapa-evolucion-contaminacion-aire-madrid/tree/master/datos).

## Descifrar datos

Una vez descargados los datos, había que descifrar su contenido. Eso lo encontré en la [página web de medioambiente del municipio de Madrid](http://www.mambiente.munimadrid.es/), exactamente me descargué un [fichero llamado INTPHORA-DIA.pdf](http://www.mambiente.munimadrid.es/opencms/export/sites/default/calaire/Anexos/INTPHORA-DIA.pdf), que también lo tenéis en [datos/INTPHORA-DIA.pdf](https://github.com/asanzdiego/mapa-evolucion-contaminacion-aire-madrid/raw/master/datos/INTPHORA-DIA.pdf).

## Geo-Coordenadas de las estaciones

En los datos del Ayuntamiento de Madrid están los códigos de las estaciones atmosféricas, pero no sus coordenadas. Gracias a Félix Pedrera ([@fpedrera](https://twitter.com/fpedrera)) encontré las Geo-Coordenadas de las estaciones atmosféricas en [AirBase - The European air quality database](http://www.eea.europa.eu/data-and-maps/data/airbase-the-european-air-quality-database-8), exactamente me descargué el fichero [estaciones/AirBase_v8_stations.csv](https://github.com/asanzdiego/mapa-evolucion-contaminacion-aire-madrid/raw/master/estaciones/AirBase_v8_stations.csv).

## Filtrar y parsear estaciones

Con los datos en bruto, tenía que filtrar y parsear los datos de las estaciones atmosféricas. Para ello cree el script [estaciones-madrid-toarray.sh](https://github.com/asanzdiego/mapa-evolucion-contaminacion-aire-madrid/blob/master/estaciones-madrid-toarray.sh), en donde primero filtro las estaciones de madrid y luego parseo los datos para poder utilizarlos en otro script:

~~~Bash
# filtro las estaciones de Madrid
cat estaciones/AirBase_v8_stations.csv | grep -i madrid > estaciones/AirBase_v8_stations.madrid.csv

# exporto las estaciones de Madrid a un array de Shell Script
awk -F "\t" '{print "estaciones["$2"]=\"" $13 "_" $14 "\""}' estaciones/AirBase_v8_stations.madrid.csv > estaciones/estaciones-madrid-toarray.txt
~~~
