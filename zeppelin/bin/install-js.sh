#!/usr/bin/env bash

rsync -av /zeppelin/bootstrap/js/ /zeppelin/webapps/webapp/scripts/

rsync -av /zeppelin/bootstrap/css/ /zeppelin/webapps/webapp/styles/