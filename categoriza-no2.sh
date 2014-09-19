function categoriza() {

    # longitud;latitud;parametro;abrebiatura;descripcion;anio-mes-dia;valor

    echo "longitud;latitud;parametro;abrebiatura;descripcion;anio-mes-dia;valor;categoria" > NO2-Nitrogen-Dioxide-Madrid-Evolution.csv

    cat filtrados/NO2-DIOXIDO_DE_NITROGENO.csv | awk -F ";" '{ if ($7<25) { print $0 ";24" } }' >> NO2-Nitrogen-Dioxide-Madrid-Evolution.csv
    cat filtrados/NO2-DIOXIDO_DE_NITROGENO.csv | awk -F ";" '{ if ($7>24 && $7<50) { print $0 ";25-49" } }' >> NO2-Nitrogen-Dioxide-Madrid-Evolution.csv
    cat filtrados/NO2-DIOXIDO_DE_NITROGENO.csv | awk -F ";" '{ if ($7>49 && $7<75) { print $0 ";50-74" } }' >> NO2-Nitrogen-Dioxide-Madrid-Evolution.csv
    cat filtrados/NO2-DIOXIDO_DE_NITROGENO.csv | awk -F ";" '{ if ($7>74 && $7<100) { print $0 ";75-99" } }' >> NO2-Nitrogen-Dioxide-Madrid-Evolution.csv
    cat filtrados/NO2-DIOXIDO_DE_NITROGENO.csv | awk -F ";" '{ if ($7>99 && $7<125) { print $0 ";100-124" } }' >> NO2-Nitrogen-Dioxide-Madrid-Evolution.csv
    cat filtrados/NO2-DIOXIDO_DE_NITROGENO.csv | awk -F ";" '{ if ($7>124 && $7<150) { print $0 ";125" } }' >> NO2-Nitrogen-Dioxide-Madrid-Evolution.csv

    # longitud;latitud;parametro;abrebiatura;descripcion;anio-mes-dia;valor;categoria
}

categoriza
