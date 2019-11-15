#!/bin/bash -x

#Author ROHAN RAVINDRA KADAM
#Date 15 NOV 2019

echo "Welcome to Snake And Ladder"

PLAYER=1;
START_POSITION=0;
END_POSITION=100;

rollDice=$(( RANDOM%6+1 ));
checkPosition=$(( RANDOM%3 ));
if [[ $checkPosition -eq 0   ]]
then
	  currentPosition=$(( $START_POSITION + $rollDice ))
elif [[ $checkPosition -eq 1 ]]
then
   	currentPosition=$(( $START_POSITION - $rollDice ))
else
   	echo "NO Play"
fi
