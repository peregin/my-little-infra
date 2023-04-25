#!/bin/bash

# this doesn't work sometimes
certbot renew --pre-hook "systemctl stop nginx" --post-hook "systemctl start nginx"

# RENEW - use this !!!
# sudo certbot renew
# sudo systemctl restart nginx

# remove old one
# sudo certbot revoke --cert-name velocorner.com
# list
# sudo certbot certificates