#!/bin/bash
#
# Install or upgrade Jenkins.
#
set -e

# Note that we absolutely have to specify a password here, otherwise Helm
# generates a random password, but it does not work.

./scripts/helm.sh --set master.image=dcycle/jenkins-helm \
  --set master.adminPassword="$(./scripts/uuid.sh)" \
  --set master.tag=1 \
  --set agent.enabled=false \
  upgrade --install my-jenkins stable/jenkins
