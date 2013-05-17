#
# Cookbook Name:: fuse-esb
# Recipe:: default
#
# Copyright 2013, EPAM Systems
#
# All rights reserved - Do Not Redistribute
#
include_recipe "java"
include_recipe "ark"

group node['fuse-esb']['group'] do
	action :create
end

user node['fuse-esb']['user'] do
	comment "FuseESB Service User"
	gid node['fuse-esb']['group']
	home node['fuse-esb']['home']
	shell "/bin/false"
	system true
	action :create
end

ark "fuse-esb" do
	url node['fuse-esb']['url']
	prefix_root node['fuse-esb']['prefix_root'] 
	home_dir node['fuse-esb']['home']
	version node['fuse-esb']['version']
	checksum node['fuse-esb']['checksum']
	action :install
end

template "/etc/profile.d/fuse_home.sh" do
  mode 0755
  source "fuse_home.sh.erb"
end

if node['fuse-esb']['use_upstart'] 
	template "/etc/init/#{node['fuse-esb']['service_name']}.conf" do
		mode 0644
		owner "root"
		source "fuse.conf.erb"
	end
	link "/etc/init.d/#{node['fuse-esb']['service_name']}" do
		to "/lib/init/upstart-job"
		only_if "test -f /etc/init/#{node['fuse-esb']['service_name']}.conf"
	end
end

template "#{node['fuse-esb']['home']}/etc/users.properties" do
	mode 0755
	source "user.properties.erb"
end

service "fuse" do
	service_name node['fuse-esb']['service_name']
 	if node['fuse-esb']['use_upstart']
 		provider Chef::Provider::Service::Upstart
 	end
 	supports :status => true, :restart => true, :reload => true
 	action [:enable, :start]
end