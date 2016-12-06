require 'rubygems'
require 'json'
require 'octokit'
client = Octokit::Client.new(:access_token => GITHUB_DANGER_API_TOKEN)
user = client.user
user.login
data = JSON.parse(json)
Octokit.add_labels_to_an_issue("bayandin/awesome-awesomeness", data['number'], ['Changes Required'])
