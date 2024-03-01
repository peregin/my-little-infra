#!/bin/bash

# for testing use --dry-run
certbot -m velocorner.com@gmail.com \
 -d velocorner.com \
 -d www.velocorner.com \
 -d dev.velocorner.com \
 -d status.velocorner.com \
 -d docker.velocorner.com \
 -d search.velocorner.com \
 -d peregin.com \
 -d www.peregin.com \
 -d demo.peregin.com \
 --webroot -w /opt/letsencrypt certonly