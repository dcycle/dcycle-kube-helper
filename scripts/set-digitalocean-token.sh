#!/bin/bash
#
# Remember your digitalocean token in your home folder.
#
set -e

if [ -z "$DOTOKEN" ] || [ -z "$DOCLUSTERUUID" ] || [ -z "$DOCLUSTERNAME" ]; then
  >&2 echo "Before running this script please run:"
  >&2 echo "export DOTOKEN=<your digitan ocean token here>"
  >&2 echo "export DOCLUSTERUUID=<your digital ocean cluster uuid here>"
  >&2 echo "export DOCLUSTERNAME=<name your cluster here>"
  exit 1;
fi

mkdir -p "$HOME/.digitalocean"
echo "DOTOKEN=$DOTOKEN" > "$HOME/.digitalocean/$DOCLUSTERNAME"
echo "DOCLUSTERUUID=$DOCLUSTERUUID" >> "$HOME/.digitalocean/$DOCLUSTERNAME"
# Remove read access except for yourself.
chmod go-r "$HOME/.digitalocean/$DOCLUSTERNAME"

echo ""
echo "All done, to see your token file check:"
echo ""
echo '    cat "$HOME/.digitalocean/'"$DOCLUSTERNAME"'"'
echo ""
echo "Note that your token is stored in the clear; use an encrypted secrets"
echo "manager for production or sensitive clusters."
echo ""
