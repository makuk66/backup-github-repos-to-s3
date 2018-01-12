#!/bin/bash
rm -f repo-list.txt
for org in "$@"; do
  docker run -it \
    -v "$PWD/list-repos.rb:/list-repos.rb" \
    -v "$PWD/token:/token" \
    octokit ruby /list-repos.rb "$org" > repo-list.txt
done
