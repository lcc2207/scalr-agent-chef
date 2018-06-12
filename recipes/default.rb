# used to by pass import after it has run once
file node['scalr-agent-chef']['check_file'] do
  owner 'root'
  group 'root'
  mode '0600'
  action :nothing
end

# setup repos
include_recipe 'scalr-agent-chef::ubuntu' if ubuntu?
include_recipe 'scalr-agent-chef::rhel' if rhel? || amazon_linux?
include_recipe 'scalr-agent-chef::windows' if windows?

# install agent
include_recipe 'scalr-agent-chef::scalarizr'

# register
include_recipe 'scalr-agent-chef::register'
