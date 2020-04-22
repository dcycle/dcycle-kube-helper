#!/bin/bash
set -e

echo '=> deleting chart'

./scripts/helm.sh delete my-encryption

echo '=> all done!'
