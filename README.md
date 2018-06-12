# scalr-agent-chef

Cookbook to deploy the Scalarizr Agent and import instances into scalr

# Recipes

default:

# Attributes

This cookbook will look for an attribute names ** scalr-agent-id **

You can set this attribue on existing nodes by running the following command on your knife workstation:

knife exec -E "nodes.find('name:**chef-instances-name**') { |n| n.normal_attrs['scalr-agent-id']='**Scalr import id**'; n.save}"
