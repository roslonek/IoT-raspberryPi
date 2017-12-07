#!/bin/bash
directory=`pwd`;
for d in $(find $directory -maxdepth 1 -type f);
do
  #Do something, the directory is accessible with $d:
  echo $d
  tr -d "\n\r" < $d 
done
#done >output_file
