#!/bin/bash
#
# Install or upgrade Jenkins.
#
set -e

./scripts/helm.sh --set master.image=dcycle/jenkins-helm \
  --set master.tag=1 \
  --set agent.enabled=false \
  upgrade --install my-jenkins stable/jenkins
