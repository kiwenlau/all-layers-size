#!/usr/bin/python

# get all layer size of a docker image according to the output of "docker history" command
# the layer sizes are printed from bottom layer to top layer 

import sys

f = open(sys.argv[1], "r")

lines = f.readlines()

lines.reverse()

for line in lines :
    line.rstrip('\n')
    tmp = line.split(' ')
    number = tmp[len(tmp)-2]
    if "GB" in line :
        sizeKB = float(number)*1024*1024
    elif "MB" in line :
	sizeKB = float(number)*1024
    elif "KB" in line :
	sizeKB = float(number)
    else :
	sizeKB = float(number)/1024
    print sizeKB

f.close()
