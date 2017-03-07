#
# Cookbook:: chef_run_once
# Attributes:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

default['chef_run_once'] = {}
default['chef_run_once']['chef_run_once_path'] = '/usr/local/bin/chef-run-once'
default['chef_run_once']['cmd_to_run_chef'] = '/bin/launchctl start com.chef.chef-client'
default['chef_run_once']['chef_run_once_allowed_sudoer'] = '%staff'
