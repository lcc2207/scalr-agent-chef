execute 'import scalr server' do
  command "PATH=$PATH:/opt/bin; (curl -L 'https://demo.scalr.club/public/deployAgent/#{node['scalr-agent-id']}' || (curl --tlsv1.2 --ciphers ecdhe_rsa_aes_128_gcm_sha_256 -L 'https://demo.scalr.club/public/deployAgent/#{node['scalr-agent-id']}')) | sudo bash"
  only_if { linux? }
  not_if { node['scalr-agent-id'].nil? }
  not_if { File.exist?(node['scarl-agent-chef']['check_file']) }
  notifies :create, "file[#{node['scarl-agent-chef']['check_file']}]"
end
