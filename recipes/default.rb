# used to by pass import after it has run once
file node['scalr-agent-chef']['check_file'] do
  action :nothing
end

# setup repos
apt_repository "scalr-#{node['scalr-agent-chef']['repositoryid']}" do
  uri "http://#{node['scalr-agent-chef']['baseurl']}/apt-plain/"
  distribution "#{node['scalr-agent-chef']['repositoryid']}/"
  action :add
  only_if { ubuntu? }
end

execute 'add ubuntu gpg key' do
  command 'wget -qO- http://repo.scalr.net/apt-key.gpg | apt-key add -'
  only_if { ubuntu? }
  not_if { 'apt-key list | grep 83E3E037 '}
end

yum_repository "scalr-#{node['scalr-agent-chef']['repositoryid']}" do
  description 'Scalr repo'
  baseurl "http://#{node['scalr-agent-chef']['baseurl']}/rpm/#{node['scalr-agent-chef']['repositoryid']}/rhel/#{node['scalr-agent-chef']['repo_ver']}/x86_64/"
  sslverify node['scalr-agent-chef']['sslverify']
  gpgcheck node['scalr-agent-chef']['gpgcheck']
  action :create
  only_if { rhel? || amazon_linux? }
end

# install agent
package 'scalarizr' do
  action :install
  options '--allow-unauthenticated' if ubuntu?
  source "http://#{node['scalr-agent-chef']['baseurl']}/win/#{node['scalr-agent-chef']['repositoryid']}/#{node['scalr-agent-chef']['windowspkg']}" if windows?
end

# register
execute 'import scalr instance' do
  command "PATH=$PATH:/opt/bin; (curl -L 'https://#{node['scalr-agent-chef']['serverurl']}/public/deployAgent/#{node['scalr-agent-id']}' || (curl --tlsv1.2 --ciphers ecdhe_rsa_aes_128_gcm_sha_256 -L 'https://#{node['scalr-agent-chef']['serverurl']}/public/deployAgent/#{node['scalr-agent-id']}')) | sudo bash"
  only_if { linux? }
  not_if { node['scalr-agent-id'].nil? }
  not_if { File.exist?(node['scalr-agent-chef']['check_file']) }
  notifies :create, "file[#{node['scalr-agent-chef']['check_file']}]"
end

# register windows
powershell_script 'import scalr instance' do
  code <<-EOH
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;iex ((New-Object Net.WebClient).DownloadString('https://#{node['scalr-agent-chef']['serverurl']}/public/deployAgent/#{node['scalr-agent-id']}'))
  EOH
  not_if { node['scalr-agent-id'].nil? }
  not_if { File.exist?(node['scalr-agent-chef']['check_file']) }
  notifies :create, "file[#{node['scalr-agent-chef']['check_file']}]"
end if windows?
