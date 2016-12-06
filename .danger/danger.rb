require 'optparse'
require 'rubygems'
require 'json'
require 'octokit'
client = Octokit::Client.new(:access_token => GITHUB_DANGER_API_TOKEN)
user = client.user
user.login
json = ARGV[0]
data = JSON.parse(json)
Octokit.add_labels_to_an_issue("bayandin/awesome-awesomeness", data['number'], ['Changes Required'])
