#
# Cookbook Name:: tomcat7
# Recipe:: default
#
# Copyright 2013, EPAM Systems
#
# All rights reserved - Do Not Redistribute
#
include_recipe "java"
include_recipe "ark"

# Create group
group node['tomcat7']['group'] do
	action :create
end

# Create user
user node['tomcat7']['user'] do
	comment "Tomcat7"
	gid node['tomcat7']['group']
	home node['tomcat7']['home']
	shell "/bin/false"
	system true
	action :create
end

ark "tomcat7" do
	url node['tomcat7']['url']
	prefix_root node['tomcat7']['prefix_root'] 
	home_dir node['tomcat7']['home']
	version node['tomcat7']['version']
	checksum node['tomcat7']['checksum']
	action :install
	owner node['tomcat7']['user']
	group node['tomcat7']['group']
end

if node['tomcat7']['use_upstart'] 
	template "/etc/init/#{node['tomcat7']['service_name']}.conf" do
		mode 0644
		owner "root"
		source "tomcat7.conf.erb"
	end
	link "/etc/init.d/#{node['tomcat7']['service_name']}" do
		to "/lib/init/upstart-job"
		only_if "test -f /etc/init/#{node['tomcat7']['service_name']}.conf"
	end
end

service "#{node['tomcat7']['service_name']}" do
	service_name node['tomcat7']['service_name']
 	if node['tomcat7']['use_upstart']
 		provider Chef::Provider::Service::Upstart
 	end
 	supports :status => true, :restart => true, :reload => true
 	action [:enable, :start]
end