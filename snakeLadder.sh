#!/bin/bash -x

#Author ROHAN RAVINDRA KADAM
#Date 15 NOV 2019

echo "Welcome to Snake And Ladder"

###GLOBAl CONTSTANT#####
START_POSITION=0;
END_POSITION=20;
COUNT=0;
echo "How many players do you want to play with "
read PLAYER
TURN=0;
###DICTIONARY DEFINATION###
declare -A dieChart
declare -A playersChart

##### CHECKING POSITION ######
function position(){
if [[ $checkPosition -eq 0   ]]
		then	
			START_POSITION=$(( $START_POSITION + $rollDice ))
			WON_COUNT=$(( $WON_COUNT+1  ))
			if	[[	$START_POSITION -gt $END_POSITION ]]
			then
			START_POSITION=$(( $START_POSITION - $rollDice	))
			fi
			TURN=$(( $TURN + 1   ))

		elif [ $checkPosition -eq 1 ] && [ $START_POSITION -ge 0 ]
		then
   		START_POSITION=$(( $START_POSITION - $rollDice ))

			dieChart["Position"$checkPosition]=$(( $START_POSITION ))
 			if [[ $START_POSITION -le 0 ]]
 			then
 				START_POSITION=0
 			fi
			TURN $((	$TURN + 1 ))
		else
   		START_POSITION=$START_POSITION
			TURN =$(( $TURN + 1 ))

		fi


}

###### DICE ROLLING #####
function dice(){
for(( i=0;i<$PLAYER;i++  ))
do

WON_COUNT=0;
START_POSITION=0;
	while [ $START_POSITION -lt $END_POSITION ] && [ $START_POSITION -ge 0 ]
	do
     rollDice=$(( RANDOM%6+1 ));
     checkPosition=$(( RANDOM%3 ));
	  position
	done
 playersChart[ $i ]=$WON_COUNT
#PLAYER=$(( $PLAYER-1  ))
done

}

##### MAIN  ####
dice

echo ${dieChart[@]} 
echo $WON_COUNT
echo	">>>>>>>>>>>>>>>>>>>>>> " ${!playersChart[@]}
echo ${playersChart[@]}
luckiest=$( ${playersChart[@]} | sort -n | head )



