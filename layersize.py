#!/usr/bin/python

# get all layer size of a docker image according to the output of "docker history" command
# the layer sizes are printed from bottom layer to top layer 

import sys

f = open(sys.argv[1], "r")

lines = f.readlines()

lines.reverse()

for line in lines :
    imagesize = line[89:].rstrip('\n')
    number = imagesize.split(' ')[0]
    if "GB" in imagesize :
        sizeKB = float(number)*1024*1024
    elif "MB" in imagesize :
	sizeKB = float(number)*1024
    elif "KB" in imagesize :
	sizeKB = float(number)
    else :
	sizeKB = float(number)/1024
    print sizeKB

f.close()
