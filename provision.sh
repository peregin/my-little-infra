#!/usr/bin/env bash

ENVIRONMENT=$(echo "$1" | awk '{print tolower($0)}')

function printUsage() {
  echo $"Usage: $(basename "$0") <local|aws>"
}

case "$ENVIRONMENT" in
  "local"|"aws")
    echo "provisioning environment[$ENVIRONMENT]"
    if [ "$ENVIRONMENT" == "aws" ]; then
      cd machine/aws
      export AWS_PUBLIC_IP=$(terraform output | grep public_ip | cut -d= -f2 | awk '{$1=$1;print}')
      echo "connecting to $AWS_PUBLIC_IP"
      cd ../..
    fi
    ansible-playbook -i provision/inventory/"$ENVIRONMENT" provision/playbook/site.yml
    ;;
  *)
    printUsage
    exit 1
    ;;
esac