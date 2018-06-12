windows_package 'scalrarizr' do
  source "http://#{node['scalr-agent-chef']['baseurl']}/win/#{node['scalr-agent-chef']['repositoryid']}/#{node['scarl-agent-chef']['windowspkg']}"
end
