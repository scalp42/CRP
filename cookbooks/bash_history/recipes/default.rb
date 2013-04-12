#
# Cookbook Name:: bash_history
# Recipe:: default
#
# Copyright 2013, EPAM Systems
#
# All rights reserved - Do Not Redistribute
#

file "/etc/profile.d/bash_history.sh" do
  content <<-EOS
    export HISTTIMEFORMAT=#{node['bash_history']['format']}
  EOS
  mode 0755
end