#!/usr/bin/env bash

set -x
set -e

echo "**************************************************"
ssh-add -l
ls ./plutus_playground.tobias.conf
ssh --version
ssh -F ./plutus_playground.tobias.conf playgrounds-a.internal.tobias.plutus.iohkdev.io hostname
echo "**************************************************"

terraform apply -auto-approve -target local_file.machines -target local_file.ssh_config ./terraform/
cat machines.json
cat plutus_playground.*.conf

deploy-nix
