#!/usr/bin/env bash

ENVIRONMENT=$(echo "$1" | awk '{print tolower($0)}')
ACTION=$(echo "$2" | awk '{print tolower($0)}')
if [ -z "$ACTION" ]; then
  if [ "$ENVIRONMENT" == "local" ]; then
    ACTION="up"
  else
    ACTION="create"
  fi
fi
echo "environment[$ENVIRONMENT] action[$ACTION]"

function printUsage() {
  echo $"Usage: $(basename "$0") {local|aws} [create|destroy]"
}

function setupWithVagrant() {
  cd machine/local
  cd ../..
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