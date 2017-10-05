#!/usr/bin/env bash

rsync -av --include '*/' --include '*.js' --exclude '*' /zeppelin/bootstrap/js/ /zeppelin/webapps/webapp/scripts/

rsync -av --include '*/' --include '*.css' --exclude '*' /zeppelin/bootstrap/css/ /zeppelin/webapps/webapp/styles/