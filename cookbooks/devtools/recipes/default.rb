execute "devtools" do
  user "root"
  command 'yum -y groupinstall "Develepment Tools"'
  action :run
end

package "tcl" do
  action :install
end
