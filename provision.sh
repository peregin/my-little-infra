#!/usr/bin/env bash

ENVIRONMENT=$(echo "$1" | awk '{print tolower($0)}')

function printUsage() {
  echo $"Usage: $(basename "$0") {local|aws} [create|destroy]"
}

case "$ENVIRONMENT" in
  "local")
    setupWithVagrant $ENVIRONMENT $ACTION
    ;;
  "aws")
    setupWithTerraform $ENVIRONMENT $ACTION
    ;;
  *)
    printUsage
    exit 1
    ;;
esac

echo "environment is $ENVIRONMENT"