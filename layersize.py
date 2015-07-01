#!/usr/bin/python

# get all layer size of a docker image according to the output of "docker history" command
# the layer sizes are printed from bottom layer to top layer 

import sys

f = open(sys.argv[1], "r")

lines = f.readlines()

lines.reverse()

for line in lines :
    print line[89:].rstrip('\n')

f.close()
