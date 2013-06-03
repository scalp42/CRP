#
# Cookbook Name:: crp-command-centre-ui
# Recipe:: default
#
# Copyright (C) 2013 EPAM Systems
# 
# All rights reserved - Do Not Redistribute
#
# run the nginx::default recipe to install nginx
include_recipe "nginx"

unless Chef::Config[:solo]
include_recipe "ssl"
template "#{node['nginx']['dir']}/sites-available/crp-command-centre-ui" do
    source "crp-command-centre-ui.erb"
    mode "0644"
    nginx_site "crp-command-centre-ui" do
      enable true
    end
end
end