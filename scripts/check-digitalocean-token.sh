#!/bin/bash
#
# Check ia DigitalOcean token set with ./scripts/set-digitalocean-token.sh.
#
set -e

source $HOME/.digitalocean/tutorial-token
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DOTOKEN" "https://api.digitalocean.com/v2/kubernetes/clusters"

echo ""
echo "If this works, your Digital Ocean token is set correctly!"
echo ""
