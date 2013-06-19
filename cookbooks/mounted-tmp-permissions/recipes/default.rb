#
# Cookbook Name:: mounted-tmp-permissions
# Recipe:: default
#
# Copyright 2013, EPAM Systems
#
# All rights reserved - Do Not Redistribute
#

if node['platform'] == "ubuntu" && node['platform_version'].to_f >= 10.04
template "/etc/init/mounted-tmp-permissions.conf" do
	source "mounted-tmp-permissions.conf.erb"
	mode 0644
        owner "root"
        group "root"
	variables({
		:mode => node['mounted-tmp-permissions']['mode']
	})	
end
end