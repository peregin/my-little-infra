#!/bin/bash

certbot renew --pre-hook "systemctl stop nginx" --post-hook "systemctl start nginx"

# remove old one
# sudo certbot revoke --cert-name velocorner.com
# list
# sudo certbot certificates