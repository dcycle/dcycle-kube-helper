#!/bin/bash
#
# Downloads a DigitalOcean Kubernetes YAML file to your computer.
#
set -e

if [ -z "$DOCLUSTERNAME" ]; then
  >&2 echo "Before running this script please run:"
  >&2 echo "export DOCLUSTERNAME=<name your token here>"
  exit 1;
fi

DOYAMLFILENAME="kubernetes-helper-$DOCLUSTERNAME.yml"
mkdir -p "$HOME/.kube"
source "$HOME/.digitalocean/$DOCLUSTERNAME"
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DOTOKEN" "https://api.digitalocean.com/v2/kubernetes/clusters/$DOCLUSTERUUID/kubeconfig" > "$HOME/.kube/$DOYAMLFILENAME"

echo ""
echo "All done, you can see the YAML file to interact with your cluster at:"
echo ""
echo '    cat "$HOME/.kube/'"$DOYAMLFILENAME"'"'
echo ""
