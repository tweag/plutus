#!/usr/bin/env bash
terraform apply -auto-approve -target local_file.machines -target local_file.ssh_config ./terraform/

ssh -F ./plutus_playground.tobias.conf playgrounds-a.internal.tobias.plutus.iohkdev.io hostname
ssh -F ./plutus_playground.tobias.conf playgrounds-b.internal.tobias.plutus.iohkdev.io hostname
ssh -F ./plutus_playground.tobias.conf marlowe-dash-a.internal.tobias.plutus.iohkdev.io hostname
ssh -F ./plutus_playground.tobias.conf marlowe-dash-b.internal.tobias.plutus.iohkdev.io  hostname
ssh -F ./plutus_playground.tobias.conf webghc-a.internal.tobias.plutus.iohkdev.io hostname
ssh -F ./plutus_playground.tobias.conf webghc-a.internal.tobias.plutus.iohkdev.io hostname

deploy-nix
