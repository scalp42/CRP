# Cookbook Name:: tomcat7
# Attributes:: default

default['tomcat7']['version']        = "7.0.39"
default['tomcat7']['prefix_root']    = "/opt"
default['tomcat7']['home']           = "/opt/tomcat7"
default['tomcat7']['url']            = "http://archive.apache.org/dist/tomcat/tomcat-7/v#{node['tomcat7']['version']}/bin/apache-tomcat-#{node['tomcat7']['version']}.tar.gz"
default['tomcat7']['checksum']       = "0b56c2c6cb70ba017b2b72c4354ca1f7cb935421eca911395aff03d195ab8a96"
default['tomcat7']['user']           = "tomcat7"
default['tomcat7']['group']          = "tomcat7"
default['tomcat7']['service_name']   = "tomcat7"
default['tomcat7']['use_upstart'] = node['platform'] == "ubuntu" && node['platform_version'].to_f >= 10.04