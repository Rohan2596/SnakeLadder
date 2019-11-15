#!/bin/bash -x

#Author ROHAN RAVINDRA KADAM
#Date 15 NOV 2019

echo "Welcome to Snake And Ladder"

PLAYER=1;
START_POSITION=0;
END_POSITION=100;

rollDice=$(( RANDOM%6+1 ));

