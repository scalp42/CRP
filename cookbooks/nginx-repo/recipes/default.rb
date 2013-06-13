#
# Cookbook Name:: nginx-repo
# Recipe:: default
#
# Copyright 2013, EPAM Systems
#
# All rights reserved - Do Not Redistribute
#

apt_repository "nginx-stable" do
  uri "http://ppa.launchpad.net/nginx/stable/ubuntu/"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C300EE8C"
end