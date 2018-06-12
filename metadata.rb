name 'scalr-agent-chef'
maintainer 'lynn c'
maintainer_email 'lynn@scalr.com'
license 'All Rights Reserved'
description 'Installs/Configures scalr-agent-chef'
long_description 'Installs/Configures scalr-agent-chef'
version '0.1.7'
chef_version '>= 12.1' if respond_to?(:chef_version)

# issues_url 'https://github.com/<insert_org_here>/scalr-agent-chef/issues'
# source_url 'https://github.com/<insert_org_here>/scalr-agent-chef'

depends 'chef-sugar'
