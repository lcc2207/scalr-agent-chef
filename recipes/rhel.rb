yum_repository "scalr-#{node['scalr-agent-chef']['repositoryid']}" do
  description 'Scalr repo'
  baseurl "http://#{node['scalr-agent-chef']['baseurl']}/rpm/#{node['scalr-agent-chef']['repositoryid']}/rhel/#{node['scalr-agent-chef']['repo_ver']}/x86_64/"
  sslverify node['scalr-agent-chef']['sslverify']
  gpgcheck node['scalr-agent-chef']['gpgcheck']
  action :create
end
