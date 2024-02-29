#!/usr/bin/env bash

rm ./CAREER_*
python3 generate.py

rm /home/aaf/Software/GT/GameData/Championships/Official/CAREER_*
rm /home/aaf/Software/Dev/linux_simracing/GTR2/CAREER/GameData/Championships/Official/CAREER_*

cp CAREER_* /home/aaf/Software/Dev/linux_simracing/GTR2/CAREER/GameData/Championships/Official/
cp CAREER_* /home/aaf/Software/GT/GameData/Championships/Official/
