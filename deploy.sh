#!/usr/bin/env bash

function printUsage() {
  echo $"Usage: $(basename "$0") <local|aws> <app-stack-name>"
}

ENVIRONMENT=$(echo "$1" | awk '{print tolower($0)}')
STACK=$(echo "$2" | awk '{print tolower($0)}')
if [ -z "$STACK" ]; then
  printUsage
  exit 1
fi

if [ -z "$ADMIN_PASSWORD" ]; then
  echo "ADMIN_PASSWORD environment variable must be set"
  exit 1
fi

if [ -z "$APP_CONFIG_DIR" ]; then
  echo "APP_CONFIG_DIR environment variable must be set"
  exit 1
fi
if [ ! -d "$APP_CONFIG_DIR" ]; then
  echo "[$APP_CONFIG_DIR] directory does not exists"
  exit 1
fi

case "$ENVIRONMENT" in
  "local"|"aws")
    echo "deploying to environment[$ENVIRONMENT]"
    ansible-playbook -i provision/inventory/"$ENVIRONMENT" provision/playbook/"$STACK".yml
    ;;
  *)
    printUsage
    exit 1
    ;;
esac