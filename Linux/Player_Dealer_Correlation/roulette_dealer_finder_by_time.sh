#!/bin/bash
grep -w $1 Dealers_working_during_losses > a.txt
grep -w $2 a.txt > b.txt
grep -wi $3 b.txt | awk '{print $4,$5}' 
rm a.txt b.txt




