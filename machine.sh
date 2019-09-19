#!/usr/bin/env bash

ENVIRONMENT=$(echo "$1" | awk '{print tolower($0)}')
COMMAND=$(echo "$2" | awk '{print tolower($0)}')
if [ -z "$COMMAND" ]; then
  # setup default commands
  if [ "$ENVIRONMENT" == "local" ]; then
    COMMAND="up"
  else
    COMMAND="create"
  fi
fi
echo "environment[$ENVIRONMENT] command [$COMMAND]"

function printUsage() {
  echo $"Usage: $(basename "$0") <local|aws> [command]"
}

function setupWithVagrant() {
  cd machine/local
  export ENVIRONMENT
  vagrant $COMMAND $3 $4 $5
  cd ../..
}

case "$ENVIRONMENT" in
  "local")
    setupWithVagrant $ENVIRONMENT $COMMAND
    ;;
  "aws")
    setupWithTerraform $ENVIRONMENT $COMMAND
    ;;
  *)
    printUsage
    exit 1
    ;;
esac