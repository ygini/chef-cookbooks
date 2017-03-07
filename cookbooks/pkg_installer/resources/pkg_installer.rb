#
# Cookbook Name:: pkg_installer
# Resource:: pkg
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# 
# Forked from facebook remote_pkg
# https://github.com/facebook/IT-CPE/blob/master/chef/cookbooks/remote_pkg/resources/remote_pkg.rb
#

include Chef::Mixin::ShellOut

resource_name :pkg_installer
default_action :install

property :pkg_path, :kind_of => String, :name_attribute => true
property :cleanup,:kind_of => [TrueClass, FalseClass], :default => false

property :checksum, :kind_of => String

property :installed, :kind_of => [TrueClass, FalseClass], :default => false
property :receipt, :kind_of => String
property :version, :kind_of => String, :default => nil

action :install do
	# Before checking if package is already installed, we need to find how to extract
	# all receipts ID and version from target package…
  #unless installed?

    execute "Installing #{pkg_path}" do
      command "installer -pkg '#{pkg_path}' -target /"
    end

    # Delete PKG
    file pkg_path do
      only_if { cleanup }
      action :delete
      backup false
    end
  end
end

def installed?
  if shell_out("pkgutil --pkgs='#{receipt}'").exitstatus == 0
    cmd = "pkgutil --pkg-info '#{receipt}'"
    if shell_out(cmd).stdout.include?("version: #{version}")
      msg = "Already installed; run \"sudo pkgutil --forget '#{receipt}'\""
      Chef::Log.info(msg)
      return true
    end
  end
  return false
end

