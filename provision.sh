#!/usr/bin/env bash

ENVIRONMENT=$(echo "$1" | awk '{print tolower($0)}')

function printUsage() {
  echo $"Usage: $(basename "$0") {local|aws}"
}

echo "environment[$ENVIRONMENT]"

case "$ENVIRONMENT" in
  "local|aws")
    setupWithAnsible $ENVIRONMENT
    ;;
  *)
    printUsage
    exit 1
    ;;
esac