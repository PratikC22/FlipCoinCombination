#!/bin/bash -x

#Welcome message:
echo "Welcome to flip coin combination"
sleep 1

#Getting limit value from the user:
read -p "How many rounds do you wish to play? " limit

Heads=0;
Tails=0;

#Declaring a dictionary:
declare -A Results

for (( i=1; i<=$limit; i++ ));
do
	random=$((RANDOM%2));

	if [ $random -eq 0 ];
	then
		Heads=$(($Heads+1));
		Results["Heads"]=$Heads		#Storing result in dictionary
	else
		Tails=$(($Tails+1));
		Results["Tails"]=$Tails		#Storing result in dictionary
	fi
done


#Displaying result:
echo "Heads came ${Results[Heads]} times"
echo "Tails came ${Results[Tails]} times"
echo "=================================="


#Determining win percentage:
if [ $Heads -gt $Tails ];
then
	Percentage=$(( ($Heads*100)/$limit ));
	echo "Heads Won by $Percentage%."

elif [ $Tails -gt $Heads ]
then
	Percentage=$(( ($Tails*100)/$limit ));
	echo "Tails won by $Percentage%."

elif [ $Tails -eq $Heads ];
then
	echo "It's a Tie!"
fi


