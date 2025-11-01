### MINASTIR 
apt-get update
apt-get install squid -y
apt update && apt install -y iptables
iptables -t nat -A POSTROUTING -s 192.223.0.0/16 -o eth1 -j MASQUERADE

mv /etc/squid/squid.conf /etc/squid/squid.conf.bak
nano /etc/squid/squid.conf

# ISI DENGAN 

# Port proxy
http_port 8080

# ACL jaringan internal Arda
acl localnet src 192.223.0.0/16

# Izinkan jaringan lokal
http_access allow localnet

# Tolak akses lainnya
http_access deny all

# Gunakan DNS dari Valinor (internet gateway)
dns_nameservers 192.168.122.1

# Log file
access_log /var/log/squid/access.log


service squid restart


