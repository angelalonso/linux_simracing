#!/usr/bin/env bash
# This script only seems to work for this car, because of the files naming

CAR_FOLDER="69030"
NEW_FOLDER=$1

echo ---- Copying ${CAR_FOLDER} into ${1}

if [[ ${1} == "" ]]; then
  exit 2
fi

rm ${1}/*
rmdir ${1}

cp -r ${CAR_FOLDER} ${1}

cd ${1}
mv 'mini cooper 69030 credit.txt' "mini cooper ${1} credit.txt"
FILES_IN=$(ls | grep ${CAR_FOLDER})
for f in ${FILES_IN}; do
  newfile=$(echo $f | sed "s/${CAR_FOLDER}/${1}/g")
  echo -- copying ${f} to ${newfile}
  mv ${f} ${newfile}
done

sed "s/${CAR_FOLDER}/${NEW_FOLDER}/g" ${NEW_FOLDER}_tc60_mini.car > ${NEW_FOLDER}_tc60_mini.car.aux
mv ${NEW_FOLDER}_tc60_mini.car.aux ${NEW_FOLDER}_tc60_mini.car


cd ..
