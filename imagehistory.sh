#!/bin/bash

imagetag=latest

imagelist=(axle-base gocd-server)

rm -rf history &> /dev/null
mkdir history

for imagename in ${imagelist[*]};
do 
	docker history kiwenlau/$imagename:$imagetag | grep -v IMAGE > history/$imagename.txt 
done
