# Cookbook Name:: boto
# Recipe:: update53

template "/etc/init.d/update53" do
  source "update53.erb"
  mode 0744
  owner "root"
  group "root"
end

unless Chef::Config[:solo]
  service "update53" do
    supports :start => true, :stop => true
    action [ :enable, :start]
  end
end