#!/bin/bash

certbot -m velocorner.com@gmail.com -d velocorner.com -d www.velocorner.com --webroot -w /opt/letsencrypt certonly