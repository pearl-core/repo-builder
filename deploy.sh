#!/usr/bin/env bash

set -ex

REPO_CONF="$1"
REPO_URL="$2"

REPO_DIR="$(mktemp -d -t ci-XXXXXXXXXX)/repo"

git clone ${REPO_URL} ${REPO_DIR}
mv -f "${REPO_CONF}" "${REPO_DIR}"/pearl-config/repo.conf
cd ${REPO_DIR}
git remote
git config user.email ${EMAIL}
git config user.name "${USERNAME}"
git add ./pearl-config/repo.conf

git commit -m "Update repo from repo-builder: ${TRAVIS_COMMIT}"

git push "${REPO_URL}" master

