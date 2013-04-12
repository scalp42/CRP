#
# Cookbook Name:: tomcat_database
# Recipe:: default
#
# Copyright 2013, EPAM Systems
#
# All rights reserved - Do Not Redistribute
#

include_recipe "database::mysql"

mysql_connection_info = {:host => "localhost",
                         :username => 'root',
                         :password => node['mysql']['server_root_password']}

mysql_database 'vg_crp_location' do
  connection mysql_connection_info
  action :create
end

mysql_database_user 'vg_crp_location' do
  connection mysql_connection_info
  password 'super_secret'
  database_name 'vg_crp_location'
  host '%'
  privileges [:all]
  action :grant
end