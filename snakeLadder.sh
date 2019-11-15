#!/bin/bash -x

#Author ROHAN RAVINDRA KADAM
#Date 15 NOV 2019

echo "Welcome to Snake And Ladder"


START_POSITION=0;
END_POSITION=20;
WON_COUNT=0;
COUNT=0;
declare -A dieChart
declare -A playersChart
function dice(){
PLAYER=2;
for(( i=0;i<=$PLAYER;i++  ))
do
echo "+++++++++++++++++++++++++++++++++++++++"
WON_COUNT=0;
START_POSITION=0;
	while [ $START_POSITION -lt $END_POSITION ] && [ $START_POSITION -ge 0 ]
	do
     rollDice=$(( RANDOM%6+1 ));
     checkPosition=$(( RANDOM%3 )); 

		if [[ $checkPosition -eq 0   ]]
		then

	 		START_POSITION=$(( $START_POSITION + $rollDice ))
			WON_COUNT=$(( $WON_COUNT+1  ))
			if	[[	$START_POSITION -gt $END_POSITION ]]
			then
			START_POSITION=$(( $START_POSITION - $rollDice	))
			fi

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

  		 playersChart[ $i ]=$WON_COUNT
	done

 echo  ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
#PLAYER=$(( $PLAYER-1  ))
done
}

dice

echo ${dieChart[@]} 
echo $WON_COUNT
echo	">>>>>>>>>>>>>>>>>>>>>> " ${!playersChart[@]}
echo ${playersChart[@]}
luckiest=$( printf "%s\n" ${gamblerSimulator[@]} | sort -nr | head -1 )

