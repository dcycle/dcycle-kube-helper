#!/bin/bash
#
# Install a cert manager for Let's Encrypt.
#
set -e

echo ""
echo "About to try to install the cert manager"
echo "as per https://cert-manager.io/docs/installation/helm/"
echo ""

 ./scripts/helm.sh repo add jetstack https://charts.jetstack.io
 ./scripts/helm.sh repo update
 ./scripts/helm.sh upgrade --install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.10.0 --set installCRDs=true

echo ""
echo "All done!"
echo ""
