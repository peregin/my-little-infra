#!/usr/bin/env bash

function printUsage() {
  echo $"Usage: $(basename "$0") <file> <pwd>"
}

DB_FILE=$1
DB_PWD=$2
if [ -z "$DB_PWD" ] || [ -z "$DB_FILE" ]; then
  printUsage
  exit 1
fi

echo "Database import from $1"

# from host to virtualbox vm
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i machine/local/.vagrant/machines/velocorner.local/virtualbox/private_key $DB_FILE vagrant@192.168.0.11:velocorner.export.gz
# on vm
./machine.sh local ssh << EOF
# select the proper instance
export DB_ID=$(sudo docker ps -aqf "name=velocorner_database")
echo "database container id $DB_ID"
sudo docker cp velocorner.export.gz $DB_ID:/root
sudo docker exec -it $DB_ID console.sh "connect remote:localhost/velocorner root $DB_PWD; import database /root/velocorner.export.gz"
EOF
