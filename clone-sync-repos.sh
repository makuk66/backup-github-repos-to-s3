#!/bin/bash
# clone all repos
set -euo pipefail
mkdir -p repos
while IFS=$' \t\n\r' read -r repo_url; do
  org_repo=$(sed -E 's,https://api.github.com/repos/,,' <<<"$repo_url")
  org=$(sed -E 's,/.*$,,' <<<"$org_repo")
  repo=$(sed -E 's,^.*/,,' <<<"$org_repo")
  echo "processing $org/$repo"
  repo_dir="repos/$org/$repo"
  if [ -d "$repo_dir" ]; then
      (cd "$repo_dir"; git pull)
  else
      mkdir -p "repos/$org"
      (cd "repos/$org"; git clone "git@github.com:$org/$repo")
  fi
done <repo-list.txt
