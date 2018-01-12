
Backup Github repos to S3

Uage:

put a github access token into a file named 'token',
make sure you have the aws command line client configured
and AWS_PROFILE set to a suitable profile.
Then:

```
(cd octokit-docker; ./build.sh)
./list-repos.sh GITHUB_ORG
./clone-sync-repos.sh
./upload-repos.sh BUCKET
```
