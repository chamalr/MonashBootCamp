#!/bin/bash
filename="${1}_Dealer_schedule"
read -r fl<$filename
pos=${fl/$4*/}
index=($pos) # no quotes!
xx=${#index[@]}
grep -w $2 $filename > b2.txt
grep -wi $3 b2.txt | awk -v cl="$xx" '{print $(cl+1),$(cl+2)}'
rm b2.txt
