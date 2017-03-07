name 'chef_run_once'
maintainer 'Yoann Gini'
maintainer_email 'yoann.gini@gmail.com'
license 'all_rights'
description 'Installs chef-run-once command line'
long_description 'The chef-run-once command line allow a end user without admin right to run chef service on demand'
version '0.1.0'
depends 'chef-client'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/ygini/chef-cookbooks/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/ygini/chef-cookbooks' if respond_to?(:source_url)
