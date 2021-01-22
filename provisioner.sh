setenforce 0
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
modprobe br_netfilter

echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
echo "net.bridge.bridge-nf-call-ip6tables=1" | sudo tee -a /etc/sysctl.conf
echo "net.bridge.bridge-nf-call-arptables=1" | sudo tee -a /etc/sysctl.conf
sysctl -p

yum update -y
yum install -y vim

rpm -Uvh http://repo.rundeck.org/latest.rpm
yum install -y rundeck java

yum install -y epel-release
yum install -y ansible

cd /etc/rundeck

RUNDECK_PORT="8080"
sed -i "s/localhost:4440/10.200.0.10:$RUNDECK_PORT/g" rundeck-config.properties 
echo "server.port=${RUNDECK_PORT}" >> rundeck-config.properties 

service rundeckd start