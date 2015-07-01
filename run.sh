#!/bin/bash

# 31 latest image
imagelist=(axle-base sultans-bin haproxy cb-shell dnsutils node-metrics container-metrics ruby-base ipsec multilevel drupal jruby openjdk mono glassfish jenkins-slave quickstart-python exhibitor ubuntu-perl swagger-editor serf dnsmasq gocd-base gocd-agent drill ubuntu-perl-dev devmachine buildpack-runner gcc buildstep gocd-server)

imagetag=latest

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
