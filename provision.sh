#!/usr/bin/env bash

ENVIRONMENT=$(echo "$1" | awk '{print tolower($0)}')

function printUsage() {
  echo $"Usage: $(basename "$0") <local|aws> [playbook|site]"
}

if [ -z "$ADMIN_PASSWORD" ]; then
  echo "ADMIN_PASSWORD environment variable must be set"
  exit 1
fi

PLAYBOOK=${2:-site}
echo "playbook is $PLAYBOOK.yml"

case "$ENVIRONMENT" in
  "local"|"aws")
    echo "provisioning environment[$ENVIRONMENT]"
    if [ "$ENVIRONMENT" == "aws" ]; then
      cd machine/aws
      export AWS_PUBLIC_IP=$(terraform output | grep public_ip | cut -d= -f2 | awk '{$1=$1;print}')
      echo "connecting to $AWS_PUBLIC_IP"
      cd ../..
    fi
    ansible-playbook -i provision/inventory/"$ENVIRONMENT" provision/playbook/"$PLAYBOOK".yml
    ;;
  *)
    printUsage
    exit 1
    ;;
esac