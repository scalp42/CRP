# Cookbook Name:: boto
# Recipe:: update53

template "/etc/init.d/update53" do
  source "update53.erb"
  mode 0744
  owner "root"
  group "root"
end

service "update53" do
  supports :start => true, :stop => true
  action [ :enable, :start]
  not_if { Chef::Config[:solo] }
end
