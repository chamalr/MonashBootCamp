#!/bin/bash
cat Roulette_Losses | awk '{ print substr($0, index($0,$4)) }' > b3
sed 's/\s*$//' b3 > b4
sed 's/\s*,\s*/\n/g' b4 > b5
sort b5 | uniq -c > b6
sort -rn b6 > b7
more b7 | head -n 1
rm b3 b4 b5 b6 b7
