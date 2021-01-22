sudo setenforce 0
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
sudo modprobe br_netfilter

sudo echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo echo "net.bridge.bridge-nf-call-ip6tables=1" | sudo tee -a /etc/sysctl.conf
sudo echo "net.bridge.bridge-nf-call-arptables=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

sudo yum update -y 
sudo yum install -y vim 

rpm -Uvh http://repo.rundeck.org/latest.rpm
sudo yum install -y rundeck java

sudo yum install -y epel-release
sudo yum install -y ansible

cd /etc/rundeck

RUNDECK_PORT="8080"
sed -i "s/localhost:4440/10.200.0.10:$RUNDECK_PORT/g" rundeck-config.properties 
echo "server.port=${RUNDECK_PORT}" >> rundeck-config.properties 

sudo service rundeckd start
