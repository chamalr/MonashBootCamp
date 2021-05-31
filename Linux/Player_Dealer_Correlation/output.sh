#!/bin/bash
awk '{print ARGV[1],$1,$2,$5,$6 }' 0310_Dealer_schedule | sed 's/0310_Dealer_schedule/0310/g' > Dealers_working_during_losses
awk '{print ARGV[1],$1,$2,$5,$6 }' 0312_Dealer_schedule | sed 's/0312_Dealer_schedule/0312/g' >> Dealers_working_during_losses
awk '{print ARGV[1],$1,$2,$5,$6 }' 0315_Dealer_schedule | sed 's/0315_Dealer_schedule/0315/g' >> Dealers_working_during_losses

