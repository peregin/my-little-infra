#!/usr/bin/env bash

ENVIRONMENT=$1
if [ -z "$ENVIRONMENT" ]; then
    echo "Usage: echo $(basename "$0") <ENVRIRONMENT>"
    exit 1
fi