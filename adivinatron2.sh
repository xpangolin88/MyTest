#!/bin/bash
clear
# Si pasamos como parametro x borramos fichero record
if [ $# -ne 0 ]; then # para controlar que se han pasado parametros.
if [ $1 = x ]; then
echo "Borrando fichero de records."
rm record.txt
fi
fi
#
if [ -f record.txt ]; then
POS=0
for CAMPEON in $(cat record.txt); do
let POS=POS+1
NOMBRE=$(echo $CAMPEON | cut -d: -f2)
NUMERO=$(echo $CAMPEON | cut -d: -f1)
echo "En posicisn $POS esta $NOMBRE con $NUMERO intentos"
done
else
echo '******************************************************'
echo "No hay ningun record todavia. Aprovecha la oportunidad"
echo '******************************************************'
fi
# comenzamos el juego en sm.
CONTADOR=1
let MINUMERO=$(( $RANDOM %1000 + 1)) # Numero aleatorio del 1 al 1000.
echo ' ' ; echo 'Numero Aleatorio entre 1 y 1000 '
echo '*****************************************************'
read -p "Dime tu nombre : " NOMBRE
echo '*****************************************************'
echo ' ' ; echo ' '
read -p "Llevas $CONTADOR intentos. Dime un numero: " NUMERO
#
until [ $NUMERO -eq $MINUMERO ]; do
if [ $NUMERO -gt $MINUMERO ]; then
echo "Tu numero ingresado es mayor"
else
echo "Tu numero ingresado es menor"
fi
let CONTADOR=CONTADOR+1
read -p "Llevas $CONTADOR intentos. Dime un numero: " NUMERO
done
#
echo Hombreeee, por fin acertaste.
# grabamos el record en el fichero (primero los intentos y luego el nombre)
echo $CONTADOR:$NOMBRE >> record.txt
# ordenamos para dejar arriba los que lo han hecho en menos intentos
# y nos quedamos con las 5 primeras lineas
sort record.txt -n | head -5 > recordtemp.txt
cp recordtemp.txt record.txt
echo Adios...........
./menu.sh

