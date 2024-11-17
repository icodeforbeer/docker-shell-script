#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -o className"
   echo -e "\t-o api class name of the meta-data object to be pushed to production"
   exit 1 # Exit script after printing help
}

while getopts "o:" opt
do
   case "$opt" in
      o ) metaClassName="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$metaClassName" ]
then
   echo "A required parameter -o is missing";
   helpFunction
fi

# Begin script in case all parameters are correct
echo "Moving $metaClassName to production."