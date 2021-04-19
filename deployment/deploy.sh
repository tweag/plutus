#!/usr/bin/env bash

set +x

ls machines.json
ls plutus_playground.*.conf

ssh-add -l
terraform apply -auto-approve -target local_file.machines -target local_file.ssh_config ./terraform/
deploy-nix
