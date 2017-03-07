#
# Cookbook:: chef_run_once
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

template 'chef-run-once command line' do
  source 'chef-run-once.erb'
  owner 'root'
  group 'wheel'
  mode '0755'
  path  node['chef_run_once']['chef_run_once_path']
  action :create
  variables( 
  			:chef_run_once_path => node['chef_run_once']['chef_run_once_path'],
  			:cmd_to_run_chef => node['chef_run_once']['cmd_to_run_chef']
  			)
end

directory 'sudoers.d folder' do
  owner 'root'
  group 'wheel'
  mode '0770'
  path '/etc/sudoers.d'
  action :create
end

template 'chef-run-once sudoers.d config' do
  source 'sudoers.erb'
  owner 'root'
  group 'wheel'
  mode '0440'
  path 
  action :create
  path '/etc/sudoers.d/chef-run-once'
  variables( 
  			:chef_run_once_path => node['chef_run_once']['chef_run_once_path'],
  			:chef_run_once_allowed_sudoer => node['chef_run_once']['chef_run_once_allowed_sudoer'] 
  			)
end
