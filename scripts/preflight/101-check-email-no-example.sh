set -e

FILE=./unversioned/email

source "$FILE"

echo $EMAIL | grep -v example.com && { echo 'email does not contain "example.com"'; } || { echo "email in $FILE should not contain example.com"; exit 1; }
