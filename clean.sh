#!/bin/bash
#Clean test results etc

#Docker
#Note! See https://wiki.phz.fi/Docker#Clean how to clean docker, but in practice:
/root/systools/bin/docker-clean.sh

#Clean up sh2ju test results before next build to avoid cumulation
rm -fr results/*.xml
