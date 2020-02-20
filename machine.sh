#!/usr/bin/env bash

ENVIRONMENT=$(echo "$1" | awk '{print tolower($0)}')
COMMAND=$(echo "$2" | awk '{print tolower($0)}')
if [ -z "$COMMAND" ]; then
  # setup default commands for various environments (vagrant with up, terraform with create)
  if [ "$ENVIRONMENT" == "local" ]; then
    COMMAND="up"
  else
    COMMAND="create"
  fi
fi

function printUsage() {
  echo $"Usage: $(basename "$0") <local|aws> [command]"
}

function setupWithVagrant() {
  echo "Vagrant: environment[$ENVIRONMENT] command[$COMMAND]"
  cd machine/local
  export ENVIRONMENT
  vagrant $COMMAND $3 $4 $5
  cd ../..
}

function setupWithTerraform() {
  echo "Terraform: environment[$ENVIRONMENT] command[$COMMAND]"
  cd machine/aws
  terraform init
  terraform apply
  cd ../..
}

case "$ENVIRONMENT" in
  "local")
    setupWithVagrant "$ENVIRONMENT" $COMMAND $3 $4 $5
    ;;
  "aws")
    case "$COMMAND" in
      "ssh")
        echo "TODO: ssh to EC2"
        ;;
      *)
        setupWithTerraform "$ENVIRONMENT" $COMMAND
        ;;
    esac
    ;;
  *)
    printUsage
    exit 1
    ;;
esac