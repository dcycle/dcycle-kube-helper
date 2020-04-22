#!/bin/bash
#
# Check ia DigitalOcean token set with ./scripts/set-digitalocean-token.sh.
#
set -e

if [ -z "$DOCLUSTERNAME" ]; then
  >&2 echo "Before running this script please run:"
  >&2 echo "export DOCLUSTERNAME=<name your token here>"
  exit 1;
fi

source $HOME/.digitalocean/$DOCLUSTERNAME
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DOTOKEN" "https://api.digitalocean.com/v2/kubernetes/clusters"

echo ""
echo "If this works, your Digital Ocean token is set correctly!"
echo ""
