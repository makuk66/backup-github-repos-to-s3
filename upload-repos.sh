#!/bin/bash
set -euo pipefail
BUCKET=$1
cd repos
for org in $(find . -mindepth 1 -maxdepth 1 -type d | sed 's,^./,,'); do
  cd "$org"
  for repo in $(find . -mindepth 1 -maxdepth 1 -type d | sed 's,^./,,'); do
    echo "bundling $org/$repo"
    (cd "$repo"; git bundle create "../$repo.bundle" --all)
    echo "uploading $org/$repo"
    aws --profile "$AWS_PROFILE" s3 cp "$repo.bundle" "s3://$BUCKET/$org/$repo.bundle"
    rm "$repo.bundle"
  done
  cd ..
done
