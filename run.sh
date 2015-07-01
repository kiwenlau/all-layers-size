#!/bin/bash

imagelist=(axle-base gocd-server)

rm -rf output &> /dev/null
mkdir output

for imagename in ${imagelist[*]};
do
    ./layersize.py history/$imagename.txt > output/$imagename.txt
done
