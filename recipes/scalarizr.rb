package 'scalarizr' do
  action :install
  options '--allow-unauthenticated' if ubuntu?
  source "http://#{node['scalr-agent-chef']['baseurl']}/win/#{node['scalr-agent-chef']['repositoryid']}/#{node['scarl-agent-chef']['windowspkg']}" if windows?
end
