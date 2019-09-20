#!/usr/bin/env bash

ENVIRONMENT=$(echo "$1" | awk '{print tolower($0)}')

function printUsage() {
  echo $"Usage: $(basename "$0") {local|aws}"
}

echo "environment[$ENVIRONMENT]"

case "$ENVIRONMENT" in
  "local"|"aws")
    ansible-playbook provision/playbook/site.yml
    ;;
  *)
    printUsage
    exit 1
    ;;
esac