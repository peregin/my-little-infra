#!/usr/bin/env bash

SERVICE=$(echo "$1" | awk '{print tolower($0)}')
if [ -z "$SERVICE" ]; then
  echo "Usage: $(basename "$0") <service-name>"
  exit 1
fi

echo "pulling latest image for $SERVICE ..."
docker pull peregin/velocorner."$SERVICE":latest
echo "updating $SERVICE ..."
docker service update --image peregin/velocorner."$SERVICE":latest --force velocorner_"$SERVICE"
echo "cleanup..."
docker container prune -f
docker image prune -f
echo "done!"
