%w{ memcached }.each do |pkg|
  package pkg do
    action :install
  end
end

service "memcached" do
  #supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

#template "/var/www/html/info.php" do
#  source "info.php.erb"
#  owner "apache"
#  group "apache"
#  mode 0644
#end
#
#template "/etc/httpd/conf/httpd.conf" do
#  source "httpd.conf.erb"
#  owner "root"
#  group "root"
#  mode 0644
#  notifies :reload, 'service[httpd]'
#end
#
