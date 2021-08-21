#!/bin/bash
#echo "Will print the first account alias"
# What's happening : list-account-aliases lists all the aliases
# awk gets us substring values between the quotes
# sed get us 3rd line from the output of previous
# returns first account alias

aws iam list-account-aliases | awk -F '"' '{print $2}' | sed -n '3 p'
