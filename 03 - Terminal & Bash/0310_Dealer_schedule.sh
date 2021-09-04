#!/bin/bash
echo "03/10- Dealer schedule when losses occurred" > Dealers_working_during_losses
awk '$5 == "Billy" {print $1, $2, $5, $6}' 0310_Dealer_schedule >> Dealers_working_during_losses  
