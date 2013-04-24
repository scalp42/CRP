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

mysql_database node['tomcat_database']['name'] do
  connection mysql_connection_info
  action :create
end

mysql_database_user node['tomcat_database']['user'] do
  connection mysql_connection_info
  password node['tomcat_database']['password']
  database_name node['tomcat_database']['name']
  host '%'
  privileges [:all]
  action :grant
end