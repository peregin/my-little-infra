#!/bin/bash

# eventually add peregin.com
# for testing use --dry-run
certbot -m velocorner.com@gmail.com \
 -d velocorner.com \
 -d www.velocorner.com \
 -d status.velocorner.com \
 -d marketing.velocorner.com \
 -d docker.velocorner.com \
 -d storage.velocorner.com \
 -d search.velocorner.com \
 -d dev.velocorner.com \
 --webroot -w /opt/letsencrypt certonly