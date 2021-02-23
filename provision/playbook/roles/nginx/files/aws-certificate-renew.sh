#!/bin/bash

certbot renew --pre-hook "systemctl stop nginx" --post-hook "systemctl start nginx"