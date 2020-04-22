#!/bin/bash
set -e

FILE=./encryption-chart/values.yaml
echo '# Never modify this file directly!' > "$FILE"
echo '# Use ./scripts/applys.h' >> "$FILE"

source ./unversioned/email
echo "cert_email: $EMAIL" >> $FILE
echo "" >> $FILE

if [ -f ./unversioned/other ]; then
  source ./unversioned/other
fi

echo "staging: $STAGING" >> $FILE

echo "domains:" >> $FILE
for f in $(ls -1ad ./unversioned/domains/*)
do
  source $f
  DOMAIN=$(basename -- $f)
  echo "- host: $DOMAIN" >> $FILE
  echo "  service: $SERVICE" >> $FILE
  echo "  port: $PORT" >> $FILE
  echo "  path: $DOMAIN_PATH" >> $FILE
done
