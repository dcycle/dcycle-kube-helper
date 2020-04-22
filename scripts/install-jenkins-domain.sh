#!/bin/bash
#
# Install a cert manager for Let's Encrypt.
#
set -e

if [ -z "$DOMAIN" ]; then
  >&2 echo "Please specify a domain:"
  >&2 echo ""
  >&2 echo "export DOMAIN=jenkins.example.com"
  >&2 echo "./scripts/install-jenkins-domain.sh"
  >&2 echo ""
  exit 1
fi

echo 'SERVICE=my-jenkins' > ./unversioned/domains/$DOMAIN
echo 'PORT=8080' >> ./unversioned/domains/$DOMAIN
echo 'DOMAIN_PATH=/' >> ./unversioned/domains/$DOMAIN
./scripts/apply.sh
