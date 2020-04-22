set -e

FILE=./unversioned/email
EXAMPLE=./unversioned-examples/email

if [ -f "$FILE" ]; then
  echo "$FILE exists."
else
  >&2 echo "$FILE does not exist, please create it based on $EXAMPLE"
  exit 1
fi
