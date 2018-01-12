require 'octokit'

token = File.read("/token")

Octokit.auto_paginate = true
client = Octokit::Client.new(:access_token => token)
ARGV.each do|org|
  repos = client.org_repos(org)
  repos.each do |repo|
    puts repo.url
  end
end
