estaciones[28079001]="-3.691945;40.422501"
estaciones[28079002]="-3.691945;40.409725"
estaciones[28079004]="-3.712222;40.424167"
estaciones[28079006]="-3.690833;40.437778"
estaciones[28079007]="-3.680278;40.421669"
estaciones[28079008]="-3.682222;40.421667"
estaciones[28079009]="-3.693611;40.402225"
estaciones[28079011]="-3.677222;40.451667"
estaciones[28079012]="-3.668611;40.428612"
estaciones[28079014]="-3.716667;40.385000"
estaciones[28079015]="-3.688611;40.468334"
estaciones[28079016]="-3.639167;40.440000"
estaciones[28079017]="-3.705000;40.346944"
estaciones[28079018]="-3.731944;40.394722"
estaciones[28079010]="-3.704170;40.447224"
estaciones[28079038]="-3.706389;40.445278"
estaciones[28079023]="-3.604444;40.450279"
estaciones[28079024]="-3.749167;40.420000"
estaciones[28079033]="-3.741945;40.407780"
estaciones[28079034]="-3.718333;40.441113"
estaciones[28079035]="-3.703333;40.419167"
estaciones[28079003]="-3.703333;40.419167"
estaciones[28079036]="-3.645278;40.408056"
estaciones[28079020]="-3.645278;40.408056"
estaciones[28079037]="-3.712778;40.406391"
estaciones[23050002]="-3.783611;37.781387"
estaciones[28079025]="-3.602500;40.379444"
estaciones[28079039]="-3.711389;40.478333"
estaciones[28079005]="-3.711389;40.478333"
estaciones[28079040]="-3.651389;40.388056"
estaciones[28079013]="-3.651389;40.388056"
estaciones[28123001]="-3.498333;40.321667"
estaciones[28079027]="-3.575000;40.474722"
estaciones[28079026]="-3.578889;40.459999"
estaciones[28123002]="-3.542222;40.360000"
estaciones[28079044]="-3.721111;40.490833"
estaciones[28079045]="-3.636944;40.398611"
estaciones[28079047]="-3.686667;40.398056"
estaciones[28079048]="-3.690278;40.439722"
estaciones[28079049]="-3.685556;40.409722"
estaciones[28079050]="-3.688333;40.465833"
estaciones[28079054]="-3.611944;40.372778"
estaciones[28079055]="-3.580556;40.462500"
estaciones[28079056]="-3.718611;40.384722"
estaciones[28079057]="-3.660278;40.494167"
estaciones[28079058]="-3.774444;40.518056"
estaciones[28079059]="-3.608889;40.465000"
estaciones[28079060]="-3.689722;40.500556"
estaciones[28079086]="-3.689722;40.500556"
estaciones[28079061]="-3.695000;40.402500"
estaciones[28079019]="-3.741834;40.406567"
estaciones[28079021]="-3.717420;40.439359"
estaciones[28079022]="-3.715884;40.404648"

function parsea() {

    # ESTACION (8) PARAMETROS (2-2-2) AÑO (2) MES (2) DATOS...

    echo $1
    sed 's/V/;/g' datos/$1.txt | awk -F ";" '{print substr($1,1,8)";"substr($1,9,2)";20"substr($1,15,2)"-"substr($1,17,2)"-01;"$2}' >> datos/datos.csv

    # longitud;latitud;parametro;anio-mes-dia;valor
}

echo "longitud;latitud;parametro;anio-mes-dia;valor" > datos/datos.csv

parsea datos03
parsea datos04
parsea datos05
parsea datos06
parsea datos07
parsea datos08
parsea datos09
parsea datos10
parsea datos11
parsea datos12
parsea datos13
parsea datos14

# cambio 'estacion' por 'longitud' y 'latitud'
for index in ${!estaciones[*]}
do
    value=${estaciones[$index]}
    echo $index"="$value
    sed -i "s/$index/$value/g" datos/datos.csv
done

# quita la estación que hace de media de todas las estaciones y las estaciones sin geoposición
echo "longitud;latitud;parametro;anio-mes-dia;valor" > datos-ok.csv
awk  -F ";" '$1<0 {print $0}' datos/datos.csv >> datos-ok.csv
