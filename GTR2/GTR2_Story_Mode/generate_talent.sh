#!/usr/bin/env bash
# This script Generates a set of Talents in a given FOLDER from a file with a list

FOLDER="MINI_PnG/GameData/Talent/"
LIST="Talent_list.txt"
TEMPLATE="Talent.rcd"

rm ${FOLDER}/*.rcd

while IFS= read -r line
do
  echo ----$line
   NAT=$(echo ${line} | awk -F ";" '{print $1}')
   NATIONAL=$(echo ${line} | awk -F ";" '{print $2}')
   NAME=$(echo ${line} | awk -F ";" '{print $3}')
   ABR=$(echo ${line} | awk -F ";" '{print $4}')
   SURNAME=$(echo ${line} | awk -F ";" '{print $5}')
   FILENAME=$(echo ${NAME}${SURNAME}.rcd | sed 's/ //g')
##   echo $NAT--$NATIONAL--$NAME--$ABR--$SURNAME----$FILENAME
   cat ${TEMPLATE} | sed "s/XXXXXXX/${NAME} ${SURNAME}/g" | sed "s/XXXX/${ABR} ${SURNAME}/g" | sed "s/ZZZZZZZ/${NATIONAL}/g" | sed "s/ZZZ/${NAT}/g" > ${FOLDER}/${FILENAME}
done < ${LIST}
