default['scalr-agent-chef']['baseurl'] = 'repo.scalr.net'
default['scalr-agent-chef']['serverurl'] = 'demo.scalr.club'
default['scalr-agent-chef']['repositoryid'] = 'latest'
default['scalr-agent-chef']['sslverify'] = true
default['scalr-agent-chef']['gpgcheck'] = false
default['scalr-agent-chef']['repo_ver'] = '2018.03'
default['scalr-agent-chef']['check_file'] = Chef::Config[:file_cache_path] + '/imported'
default['scalr-agent-chef']['windowspkg'] = 'scalarizr_6.7.3.msi'
