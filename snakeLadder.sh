#!/bin/bash -x

#Author ROHAN RAVINDRA KADAM
#Date 15 NOV 2019

echo "Welcome to Snake And Ladder"

PLAYER=1;
START_POSITION=0;
END_POSITION=100;

while [ $START_POSITION -lt $END_POSITION ] && [ $START_POSITION -ge 0 ]
do
rollDice=$(( RANDOM%6+1 ));
checkPosition=$(( RANDOM%3 ));

if [[ $checkPosition -eq 0   ]]
then
	  START_POSITION=$(( $START_POSITION + $rollDice ))
elif [ $checkPosition -eq 1 ] && [ $START_POSITION -ge 0 ]
then
   	START_POSITION=$(( $START_POSITION - $rollDice ))

else
   	START_POSITION=$START_POSITION
fi
done
