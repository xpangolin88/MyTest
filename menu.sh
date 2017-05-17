#!/bin/bash

function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}
codigo=${1:-"start"}
menu=${1:-"menu"}

function pause(){
   read -p "$*"
}
	jumpto $menu
# menu
	menu:
	opcion=-1
	while [ $opcion != 0 ]; do
  		clear
  		echo "1. Codigo de acceso"
  		echo "2. Jugar"
  		echo "3. Creditos"
  		echo "4. Creador"
  		echo "0. Salir"
  		echo -n "Elija una opción: "; read opcion

		if [$opcion == null]; then
			jumpto menu

  		elif [ $opcion == 1 ]; then
			jumpto codigo
  		elif [ $opcion == 2 ]; then
		  jumpto acceso
		  carga:
			echo -ne '                    (0%)\r'
			    sleep 1
			echo -ne '#                   (5%)\r'
			    sleep 1
			echo -ne '##                  (10%)\r'
			    sleep 1
			echo -ne '###                 (15%)\r'
			    sleep 1
			echo -ne '####                (20%)\r'
			    sleep 1
   			echo -ne '#####               (25%)\r'
			    sleep 1
   			echo -ne '######              (30%)\r'
			    sleep 1
   			echo -ne '#######             (35%)\r'
			    sleep 1
   			echo -ne '########            (40%)\r'
			    sleep 1
       			echo -ne '#########           (45%)\r'
			    sleep 1
     			echo -ne '##########          (50%)\r'
			    sleep 1
   			echo -ne '###########         (55%)\r'
			    sleep 1
   			echo -ne '############        (60%)\r'
			    sleep 1
   			echo -ne '#############       (65%)\r'
			    sleep 1
   			echo -ne '##############      (70%)\r'
			    sleep 1
   			echo -ne '###############     (75%)\r'
			    sleep 1
   			echo -ne '################    (80%)\r'
			    sleep 1
   			echo -ne '#################   (85%)\r'
			    sleep 1
   			echo -ne '##################  (90%)\r'
			    sleep 1
   			echo -ne '################### (95%)\r'
			    sleep 1
   			echo -ne '####################(100%)\r'
			echo -ne '\n'
			#llamada del programa
				logname
				pause 'Press [Enter] key to continue'
			#llamada al lanzador
				jumpto lanzador



		elif [ $opcion == 3 ]; then
    			echo -n "¿Cuantas veces quieres repetir el mensaje? "; read veces
    			echo -n "¿Que mensaje quieres mostrar? "; read mensaje
    			x=1
    			while [ $x -le $veces ]; do
      				clear
      			echo $x. $mensaje
      			x=$(($x+1))
    			done
  		elif [ $opcion == 0 ]; then
    			echo "Hasta luego Lucas!!!"
  		else
			echo "opcion incorrecta"
		fi
			pause 'press [Enter] key to continue....'
			jumpto menu
		read
		done

codigo:
	clear
	valor=`echo $(($RANDOM%20))`
	echo "Tu clave de acceso es: $valor "
	pause 'Press [Enter] Key to continue....'
		jumpto menu

acceso:
	clear
	echo -n "Introduzca la clave de acceso:"; read coco
	if [ $coco == $valor ]; then
		echo "Acceso concedido"
		pause 'press [Enter] key to continue...'
		jumpto carga
	else
		echo "Accceso denegado"
		pause 'Press [Enter] key to continue...'
		jumpto menu
       fi

lanzador:
	./adivinatron2.sh
