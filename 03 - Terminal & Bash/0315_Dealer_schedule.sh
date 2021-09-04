#!/bin/bash
echo "03/15- Dealer schedule when losses occurred. The 8:00pm and 11:00pm shift were the highest profit shifts for Lucky Duck. This in my opinion
was to cover the heavy losses incurred at the other noted times" >> Dealers_working_during_losses 
awk ' $5 == "Billy" {print $1, $2, $5, $6}' 0315_Dealer_schedule >> Dealers_working_during_losses
grep '05:00:00 AM , 08:00:00 AM , 02:00:00 PM' 0315_Dealer_schedule 



   
