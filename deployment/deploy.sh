#!/usr/bin/env bash
terraform apply -auto-approve -target local_file.machines -target local_file.ssh_config ./terraform/
deploy-nix
