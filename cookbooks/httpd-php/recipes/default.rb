%w{ httpd php php-pecl-memcache }.each do |pkg|
  package pkg do
    action :install
  end
end

service "httpd" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

template "/var/www/html/info.php" do
  source "info.php.erb"
  owner "apache"
  group "apache"
  mode 0644
end

template "/var/www/html/test_mem1.php" do
  source "test_mem1.php.erb"
  owner "apache"
  group "apache"
  mode 0644
end

template "/var/www/html/test_mem2.php" do
  source "test_mem2.php.erb"
  owner "apache"
  group "apache"
  mode 0644
end

template "/etc/httpd/conf/httpd.conf" do
  source "httpd.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[httpd]'
end

