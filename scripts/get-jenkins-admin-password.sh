#!/bin/bash
#
# Get Jenkins password.
#
set -e

printf $(kubectl get secret --namespace default my-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
