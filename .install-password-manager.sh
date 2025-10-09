#!/bin/sh

# exit immediately if infisical is already in $PATH
type infisical >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    brew install infisical/get-cli/infisical
    ;;
Linux)
    brew install infisical/get-cli/infisical
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac