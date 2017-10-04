Snorkel - Quick dive into your data Ocean
====

# How to launch it

1. ./build-images
   builds the docker image
2. ./start-zeppelin.sh
   starts Zeppelin container. Default port for Zeppelin is 8080, i.e. [http://localhost:8080](http://localhost:8080)

# Python and JS dependencies

`zeppelin/bootstrap/python/requirements.txt` lets you define Python pip dependencies

`zeppelin/bootstrap/js` and `zeppelin/bootstrap/css` lets you deploy JS and CSS libraries inside Zeppelin.

Call `./refresh.sh` to refresh your container without restarting it!

# Examples

## Python dependency

TODO

## JS library

TODO

## Scala dependency

TODO
