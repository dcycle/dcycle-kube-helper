#!/bin/bash
#
# Install a cert manager for Let's Encrypt.
#
set -e

echo ""
echo "About to try to install the cert manager"
echo "Don't worry about the 'Failed to download OpenAPI' error!"
echo ""

kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.13/deploy/manifests/00-crds.yaml
./scripts/helm.sh repo add jetstack https://charts.jetstack.io
./scripts/helm.sh upgrade --install cert-manager jetstack/cert-manager --version v0.13.1

echo ""
echo "All done!"
echo ""
