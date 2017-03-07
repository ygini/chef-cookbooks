#
# Cookbook:: deploy_xcode_subpackages
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

cookbook_file '/tmp/deploy_xcode_subpackages.sh' do
  source 'deploy_xcode_subpackages.sh'
  owner 'root'
  group 'wheel'
  mode '0755'
  backup false
  action :nothing
end

execute 'deploy_xcode_subpackages.sh' do
  command "/tmp/deploy_xcode_subpackages.sh"
  action :run
  only_if do ::File.exists?('/Applications/Xcode.app/Contents/MacOS/Xcode') end
  notifies :create, 'cookbook_file[/tmp/deploy_xcode_subpackages.sh]', :before
  notifies :delete, 'cookbook_file[/tmp/deploy_xcode_subpackages.sh]', :delayed
end
