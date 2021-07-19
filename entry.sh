#!/bin/bash

# add models
echo "Adding models to MG...."
for dir in $(ls /home/MG/models); do
	echo "Adding $dir"
	#TODO check this is a directory
	cp -r /home/MG/models/$dir /home/MG/$MGDIR/models
done

# here is the mg card to be run over
echo mg5_aMC $1
mg5_aMC $1
