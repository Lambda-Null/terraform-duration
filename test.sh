#!/bin/sh

cd tests
terraform fmt
terraform init > /dev/null
terraform apply -auto-approve
terraform apply -auto-approve -destroy > /dev/null
