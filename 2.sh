#!/bin/bash

#  find     - поиск чего-то по каким-то критериям
# -type f   - поиск !файла!
# -print0   - путь к текущему файлу на стандартный вывод
# -size     - размер : указывается в блоках (512 байт) или байтах(признак - за числом "с")
#   +X      - размер > x (M-мегабайты c- байты k-килобайты G-гигабайты)
#   -X      - размер <x
#   $()     - чтобы соранить вывод команды как переенную
#  


#  формат ввода: - "./2.sh каталог мин_размер макс_размер" - пример - ./2.sh ./Documents 15 50


echo 'katalog: |' $1 '|    ||    ot:' $2 '     do:' $3
myarray=$(find $1 -type f -size "+$2c" -size "-$3c")
boole=false

for i in $myarray
do

	bool=false
	for j in $myarray
	do

		if [[ ! $(cmp "$i" "$j") && ($i != $j) ]]
		then
			bool=true
		fi
	done


	if ("$bool")
	then

		echo $i
		#если не уникальный то выводить
		boole=true
	fi
done

if (! "$boole")
then
	echo 'ничего не нашлось(('
fi


