# Cookbook Name:: fuse-esb
# Attributes:: default

default['fuse-esb']['version']        = "7.0.2.fuse-097"
default['fuse-esb']['prefix_root']    = "/opt"
default['fuse-esb']['home']           = "/opt/fuse-esb"
default['fuse-esb']['url']            = "http://d1owbwdg5aiwzw.cloudfront.net/fuse-esb-full-#{node['fuse-esb']['version']}.tar.gz"
default['fuse-esb']['checksum']       = "f6983aaa633bb2dde2d12ce6f07bb0f6d61e1791c7c944f56ff7a34cb77a3ee2"
default['fuse-esb']['karaf-user']     = "smx"
default['fuse-esb']['karaf-password'] = "smx"
default['fuse-esb']['use_upstart'] = node['platform'] == "ubuntu" && node['platform_version'].to_f >= 10.04
default['fuse-esb']['service_name'] = "fuse"