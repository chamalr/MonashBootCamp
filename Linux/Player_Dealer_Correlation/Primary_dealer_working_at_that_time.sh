#!/bin/bash
cat Dealer_names > c1
sort c1 | uniq -c > c2
sort -rn c2 > c3
more c3  | head -n 1
rm c1 c2 c3
