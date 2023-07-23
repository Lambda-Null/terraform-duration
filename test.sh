#!/bin/sh

top=$(pwd)

for dir in tests/*
do
    cd $dir
    terraform fmt
    terraform init > /dev/null
    terraform apply -auto-approve
    terraform apply -auto-approve -destroy > /dev/null
    cd $top
done
