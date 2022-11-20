#!/bin/bash
#
# Get Jenkins password.
#
set -e

kubectl exec --namespace default -it svc/my-jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo
