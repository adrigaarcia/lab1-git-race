#!/bin/bash

# Download the base image to do our personal image
docker pull gradle:openj9

# -t option to tag the image as "lab1-git-race"
docker build -t lab1-git-race .

# Author: Tomás Pelayo - 779691 