message "Hi @#{github.pr_author} thank you for your submission at Awesome-Awesomeness. Be sure that you haven't got any errors below this. For any questions, ping @m1guelpf"
#Check for changes to README.md
has_readme_changes = git.modified_files.include?("README.md")
can_merge = github.pr_json["mergeable"]
warn("This PR cannot be merged yet.", sticky: false) unless can_merge
# Ensure there is a summary for a pull request
fail 'Please provide a summary in the Pull Request description' if github.pr_body.length < 5

# Warn if PR guideline boxes are not checked.
fail 'Please check PR guidelines and check the boxes.' if github.pr_body.include? '- [ ]'
# Warn the user if pull request fields remain unchanged
fail 'Please replace **[Insert URL to the list here.]** with the URL to the list.' if github.pr_body.include? '**[Insert URL to the list here.]**'
fail 'Please replace **[Explain what this list is about and why it should be included here.]** with an explanation of why we should include this list.' if github.pr_body.include? '**[Explain what this list is about and why it should be included here.]**'
# Warn if pull request is not updated
fail 'Please update the Pull Request title to contain the script name' if github.pr_title.include? 'Update README.md'
# Warn if there is [WIP] in the title
warn "PR is classed as Work in Progress" if github.pr_title.include? "[WIP]"
# Warn when there are merge commits in the diff
fail 'Please rebase to get rid of the merge commits in this Pull Request' if git.commits.any? { |c| c.message =~ /^Merge branch 'master'/ }

# Check links
if has_readme_changes
 require 'json'
 results = File.read 'ab-results-temp.md-markdown-table.json'
 j = JSON.parse results
 if j['error']==true
  fail j['title']
  markdown j['message']
 end
end
