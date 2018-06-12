default['scalr-agent-chef']['baseurl'] = 'repo.scalr.net'
default['scalr-agent-chef']['repositoryid'] = 'stable'
default['scalr-agent-chef']['sslverify'] = true
default['scalr-agent-chef']['gpgcheck'] = false
default['scalr-agent-chef']['repo_ver'] = '2018.03'
default['scarl-agent-chef']['check_file'] = Chef::Config[:file_cache_path] + '/imported'
