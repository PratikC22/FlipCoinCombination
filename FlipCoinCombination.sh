#!/bin/bash -x

echo "Welcome to flip coin simulation : "
sleep 1

#Generating a random number.
random=$(( RANDOM%2 ));

if [ $random -eq 0 ];
then
	echo "Heads wins!";
else
       	echo "Tails Wins!";
fi
