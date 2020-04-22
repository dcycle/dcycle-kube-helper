set -e

FILE=./unversioned/domains
EXAMPLE=./unversioned-examples/domains
EXIST=false

mkdir -p "$FILE"
for f in $(ls -1ad "$FILE"/*)
do
  echo "$f" | grep -v example.com && { echo "Domain $f does not contain example.com"; } || { echo "Domain $f contains example.com; it should not"; exit 1; }
  EXIST=true
done

if [ $EXIST == false ]; then
  >&2 echo "There should be at least one domain in $FILE. Use $EXAMPLE for an example"
  exit 1
fi
