#!/usr/bin/env bash

set -x
set -e

strace ls
ssh-add -l
terraform apply -auto-approve -target local_file.machines -target local_file.ssh_config ./terraform/
cat machines.json
cat plutus_playground.*.conf

deploy-nix
