#!/usr/bin/env bash

ENVIRONMENT=$(echo "$1" | awk '{print tolower($0)}')
ACTION=$(echo "$2" | awk '{print tolower($0)}')
if [ -z "$ACTION" ]; then
  ACTION="create"
fi

function printUsage() {
  echo $"Usage: $(basename "$0") {local|aws} [create|destroy]"
}

case "$ACTION" in
  "create"|"destroy")
    ;;
  *)
    printUsage
    exit 1
    ;;
esac

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
