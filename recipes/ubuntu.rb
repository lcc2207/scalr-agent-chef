apt_repository "scalr-#{node['scalr-agent-chef']['repositoryid']}" do
  uri "http://#{node['scalr-agent-chef']['baseurl']}/apt-plain/"
  distribution "#{node['scalr-agent-chef']['repositoryid']}/"
  action :add
end
