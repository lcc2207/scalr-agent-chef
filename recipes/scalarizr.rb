package 'scalarizr' do
  action :install
  options '--allow-unauthenticated' if ubuntu?
end
