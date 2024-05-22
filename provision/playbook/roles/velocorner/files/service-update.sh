#!/usr/bin/env bash

SERVICE=$(echo "$1" | awk '{print tolower($0)}')
if [ -z "$SERVICE" ]; then
  echo "Usage: $(basename "$0") <service-name>"
  exit 1
fi

echo "updating $SERVICE ..."
docker service update --force velocorner_"$SERVICE"