function filtra() {

    # longitud;latitud;parametro;anio-mes-dia;valor

    echo $2 $3
    echo "longitud;latitud;parametro;abrebiatura;descripcion;anio-mes-dia;valor;categoria" > filtrados/$2-$3.csv
    cat datos-ok.csv | awk -v parametro=$1 -v abrebiatura=$2 -v descripcion=$3 -F ";" '{ if ($3==parametro) { print $1 ";" $2 ";" $3 ";" abrebiatura ";" descripcion ";" $4 ";" $5 } }' >> filtrados/$2-$3.csv

    sed -i "s/0.000N//g" filtrados/$2-$3.csv
    sed -i "s/00.00N//g" filtrados/$2-$3.csv
    sed -i "s/1;0/1;/g" filtrados/$2-$3.csv
    sed -i "s/1;00/1;/g" filtrados/$2-$3.csv
    sed -i "s/1;000/1;/g" filtrados/$2-$3.csv

    # longitud;latitud;parametro;abrebiatura;descripcion;anio-mes-dia;valor
}

filtra 01 SO2   DIOXIDO_DE_AZUFRE
filtra 02 HNN   HUMO_NEGRO
filtra 03 SPM   PARTICULAS_EN_SUSPENSION
filtra 04 AF    ACIDEZ_FUERTE
filtra 05 CO2   DIOXIDO_DE_CARBONO
filtra 06 CO    MONOXIDO_DE_CARBONO
filtra 07 NO    MONOXIDO_DE_NITROGENO
filtra 08 NO2   DIOXIDO_DE_NITROGENO
filtra 09 PM3   PARTICULAS_EN_SUSPENSION_MENOR_2_5
filtra 10 PM10  PARTICULAS_EN_SUSPENSION_MENOR_10
filtra 12 NOx   OXIDOS_DE_NITROGENO_TOTALES
filtra 14 O3    OZONO
filtra 18 A-    ANIONES
filtra 19 Pb    PLOMO
filtra 20 TOL   TOLUENO
filtra 28 Cd    CADMIO
filtra 30 BEN   BENCENO
filtra 35 EBE   ETILBENCENO
filtra 36 BUT   BUTADIENO
filtra 37 MXY   METAXYLENO
filtra 38 PXY   PARAXYLENO
filtra 39 OXY   ORTOXYLENO
filtra 42 HC    HIDROCARBUROS_TOTALES_EXANO
filtra 43 CH4   METANO
filtra 44 NMH   HIDROCARBUROS_NO_METANICOS
filtra 50 PSD   PARTICULAS SEDIMENTABLES
filtra 51 HAP   HIDROCARBUROS_AROMATICOS_POLICICLICOS
filtra 52 VOC   COMPUESTOS_ORGANICOS_VOLATILES
filtra 53 Cl2   CLORO_MOLECULAR
filtra 54 FH    FLUORURO_DE_HIDROGENO
filtra 55 Cl-   CLORUROS
filtra 56 F-    FLUORUROS
filtra 57 Br-   BROMUROS
filtra 58 HCl   ACIDO_CLORHIDRICO
filtra 59 Cu    COBRE
filtra 60 Fe    HIERRO
filtra 61 Mn    MANGANESO
filtra 62 Ni    NIQUEL
filtra 63 NH3   AMONIACO
filtra 64 HCP   HIDROCARBUROS_PETROLIGENOS
filtra 65 SH2   SULFURO_DE_HIDROGENO
filtra 66 ASB   ASBESTOS
filtra 80 UV    RADIACION_ULTRAVIOLETA
filtra 81 VV    VELOCIDAD_DE_VIENTO
filtra 82 DD    DIRECCION_DE_VIENTO
filtra 83 TMP   TEMPERATURA_MEDIA
filtra 84 TMX   TEMPERATURA_MAXIMA
filtra 85 TMI   TEMPERATURA_MINIMA
filtra 86 HR    HUMEDAD_RELATIVA
filtra 87 PRB   PRESION_BAROMETRICA
filtra 88 RS    RADIACION_SOLAR
filtra 89 LL    PRECIPITACION
filtra 90 EST   ESTABILIDAD
filtra 92 LLA   LLUVIA_ACIDA
