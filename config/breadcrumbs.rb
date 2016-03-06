
crumb :posts_index do
  link 'posts', posts_path
end

crumb :posts_show do |post|
  link post.title.truncate(20), post_path(post)
  parent :posts_index
end
crumb :posts_new do
  link 'New'
  parent :posts_index
end
crumb :posts_create do
  link 'New'
  parent :posts_index
end
crumb :posts_edit do |post|
  link 'Edit'
  parent :posts_show, post
end
# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
