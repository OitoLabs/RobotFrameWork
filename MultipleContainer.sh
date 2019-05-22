#!/bin/bash

if [ ${1: -6} == ".robot" ]
then
  echo "$1"
  # Git pull latest change and search for testsuite of .robot file
  cd ../PRP-TestCase
  git pull   
  testsuite_name=$(basename $(dirname $(find . -name "$1")))
  echo $testsuite_name
  cd ../PRP-RobotFramework-Demo
  ./robot.sh start-test pro $testsuite_name $1 $testsuite_name prp-$testsuite_name
else
  ./robot.sh start-test pro testsuite-0 $1 testsuite-0 prp-testsuite-0 
  ./robot.sh start-test pro testsuite-1 $1 testsuite-1 prp-testsuite-1      
fi
