#/bin/bash
#autor: Francisco Vazquez N'Mira

autor=Francisco
edutor=24

read -p "Como te llamas:" envitado
read -p "Cual es tu edad:" edutado

if [ $autor == $envitado ] && [$edutor == $edutado ]; then
	echo "Tu eres el desarrollador: " $autor
elif [ $autor != $envitado ] && [ $edutor != $edutado ]; then
echo "Lo siento, pero tu no eress el desarrolladdor" $autor "Tu eres:" $envitado

elif [ $autor == $envitado ] && [ $edutor != $edutado ]; then
echo "Lo siento, pero tu no eress el desarrolladdor" $autor "Tu tienes:" $edutado

elif [ $autor != $envitado ] && [ $edutor == $edutado ]; then
echo "Lo siento, pero tu no eress el desarrolladdor" $autor "Tu eres:" $envitado

fi
