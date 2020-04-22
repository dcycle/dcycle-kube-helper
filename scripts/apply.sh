#!/bin/bash
#
# Not executable; run with source, see ./README.md
#
set -e

# See http://patorjk.com/software/taag/#p=display&f=Ivrit&t=Helm%20Encrypt%20Helper
cat ./scripts/lib/ascii-art.txt

echo '=> preflight'

for f in ./scripts/preflight/*.sh
do
  source $f
done

echo '=> construct the values.yaml file'

source ./scripts/lib/make-values-file.sh

echo '=> installing the chart'

./scripts/helm.sh upgrade --install my-encryption encryption-chart

echo '=> all done!'
