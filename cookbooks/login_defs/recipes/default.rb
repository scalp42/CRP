#
# Cookbook Name:: login_defs
# Recipe:: default
#
# Copyright (C) 2013 EPAM Systems
# 
# All rights reserved - Do Not Redistribute
#


template "/etc/login.defs" do
	source "login.defs.erb"
	mode 0644
        owner "root"
        group "root"
	variables({
		:umask => node['login_defs']['umask']
	})	
end
	