#!/usr/bin/env bash

rm ./80s_GROWTH_*
python3 generate.py

rm /home/aaf/Software/GT/GameData/Championships/Official/80s_GROWTH_*
rm /home/aaf/Software/Dev/linux_simracing/GTR2/80s_GROWTH/GameData/Championships/Official/80s_GROWTH_*

cp 80s_GROWTH_* /home/aaf/Software/Dev/linux_simracing/GTR2/80s_GROWTH/GameData/Championships/Official/
cp 80s_GROWTH_* /home/aaf/Software/GT/GameData/Championships/Official/
