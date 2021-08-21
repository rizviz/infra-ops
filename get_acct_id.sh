#!/bin/bash
#echo "Will print the first account alias"
# What's happening : caller-id lists all the aliases
# awk gets us substring values between the quotes for the 4th arg
# sed get us 3rd line from the output of caller-id
# returns account id
aws sts get-caller-identity  | sed -n '3 p' | awk -F '"' '{print $4}'
