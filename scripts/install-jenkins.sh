#!/bin/bash
#
# Install or upgrade Jenkins.
#
set -e

echo "Install or upgrade Jenkins as per"
echo "https://github.com/jenkinsci/helm-charts"
echo "and"
echo "https://octopus.com/blog/jenkins-helm-install-guide"

./scripts/helm.sh repo add jenkins https://charts.jenkins.io
./scripts/helm.sh repo update
./scripts/helm.sh \
  --set persistence.size="5Gi" \
  --set controller.tag=1 \
  --set controller.image=dcycle/jenkins-helm \
  upgrade --install my-jenkins jenkins/jenkins
