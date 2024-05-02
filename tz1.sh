#!/bin/bash

#заводим переменные
IN_DIR=""
OUT_DIR=""
COUNT=0

#пользователь вводит входную и выходную директории
read -p "vvedite vhodnuyu direktoriyu: " IN_DIR
read -p "vvedite vihodnuyu direktoriyu: " OUT_DIR

#проверяем, существует ли входная директория
if [ -d $IN_DIR ]; then

#проверяем, существует ли выходная директория
  if [ -d $OUT_DIR ]; then
    echo "starting copy"
  else
    #если не существет выходной – создаём
    mkdir $OUT_DIR
    echo "starting copy"
  fi
  
#проходим по всем файлам
for FILE in $(find $IN_DIR -type f)
do
COUNT=$((COUNT+1))
FILENAME="${FILE##*/}"
#создаём новое название файла, для обработки ошибок с одинаковыми названиями файлов
FILENAME2="${COUNT}_${FILENAME}"
cp "$FILE" "$OUT_DIR/${FILENAME2}"
done  

echo "fayli skopirovani uspeschno"
#если входной директории не существует – выводим ошибку    
else
  echo "Error: vhodnoy direktorii ne suschestvuet"
fi


