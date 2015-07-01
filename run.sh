#!/bin/bash

imagelist=(axle-base gocd-server)


# get the history of images 
rm -rf history &> /dev/null
mkdir history

for imagename in ${imagelist[*]};
do
        docker history kiwenlau/$imagename:$imagetag | grep -v IMAGE > history/$imagename.txt
done

# calculate layers size for all images
rm -rf output &> /dev/null
mkdir output

for imagename in ${imagelist[*]};
do
    ./layersize.py history/$imagename.txt > output/$imagename.txt
done
