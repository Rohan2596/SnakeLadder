#!/bin/bash -x

#Author ROHAN RAVINDRA KADAM
#Date 15 NOV 2019

echo "Welcome to Snake And Ladder"

PLAYER=1;
START_POSITION=0;
END_POSITION=100;
WON_COUNT=0
delcare -A dieChart
function dice(){
while [ $START_POSITION -le $END_POSITION ] && [ $START_POSITION -ge 0 ]
do
rollDice=$(( RANDOM%6+1 ));
checkPosition=$(( RANDOM%3 ));

if [[ $checkPosition -eq 0   ]]
then

	  START_POSITION=$(( $START_POSITION + $rollDice ))
	WON_COUNT=$(( $WON_COUNT+1  ))
elif [ $checkPosition -eq 1 ] && [ $START_POSITION -ge 0 ]
then
   	START_POSITION=$(( $START_POSITION - $rollDice ))

dieChart["Position"$checkPosition]=$(( $START_POSITION ))
 if [[ $START_POSITION -le 0 ]]
 then
 START_POSITION=0
 fi 
else
   	START_POSITION=$START_POSITION
fi
done

}
dice
echo ${dieChart[@]} 
echo $WON_COUNT
