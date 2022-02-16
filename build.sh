#!/usr/bin/env bash

DIST_DIR="./dist/"

if [ -d "${DIST_DIR}" ]; then
  rm -R "${DIST_DIR}"
fi
mkdir "${DIST_DIR}" "${DIST_DIR}/node"


cp -R \
  ./seshat/seshat-node/* \
  "${DIST_DIR}/node"
cp -R ./seshat/data "${DIST_DIR}/"
jq -s '.[0] * .[1]' seshat/seshat-node/package.json ./js/overwrite.package.json > "${DIST_DIR}/node/package.json"

echo '
[dependencies.rusqlite]
version = "0.26.3"
features = ["bundled", "bundled-sqlcipher-vendored-openssl"]' >> "${DIST_DIR}/node/native/Cargo.toml"
