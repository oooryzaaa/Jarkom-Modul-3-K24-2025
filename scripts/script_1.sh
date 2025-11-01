### DURIN [ROUTER]
auto eth0
iface eth0 inet static
    address 192.223.0.2
    netmask 255.255.255.252
    gateway 192.223.0.1

auto eth1
iface eth1 inet static
    address 192.223.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 192.223.2.1
    netmask 255.255.255.0

auto eth3
iface eth3 inet static
    address 192.223.3.1
    netmask 255.255.255.0

auto eth4
iface eth4 inet static
    address 192.223.4.1
    netmask 255.255.255.0

auto eth5
iface eth5 inet static
    address 192.223.5.1
    netmask 255.255.255.0

### ROOT DURIN

apt update && apt install -y iptables
iptables -t nat -A POSTROUTING -s 192.223.0.0/16 -o eth0 -j MASQUERADE
echo "nameserver 192.168.122.1" > /etc/resolv.conf


### CLIENT ##

### SWITCH 1 ###

### ELENDIL
auto eth0
iface eth0 inet static
    address 192.223.1.2
    netmask 255.255.255.0
    gateway 192.223.1.1
    dns-nameservers 192.168.122.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### ISILDUR
auto eth0
iface eth0 inet static
    address 192.223.1.3
    netmask 255.255.255.0
    gateway 192.223.1.1
    dns-nameservers 192.168.122.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### ANARION
auto eth0
iface eth0 inet static
    address 192.223.1.4
    netmask 255.255.255.0
    gateway 192.223.1.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### MIRIEL
auto eth0
iface eth0 inet static
    address 192.223.1.5
    netmask 255.255.255.0
    gateway 192.223.1.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### AMANDIL
auto eth0
iface eth0 inet dhcp

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### ELROS 
auto eth0
iface eth0 inet static
    address 192.223.1.7
    netmask 255.255.255.0
    gateway 192.223.1.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### SWITCH 2 ###

### MINASTIR 
auto eth0
iface eth0 inet static
    address 192.223.2.2
    netmask 255.255.255.0
    gateway 192.223.2.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### GALADRIEL
auto eth0
iface eth0 inet static
    address 192.223.2.3
    netmask 255.255.255.0
    gateway 192.223.2.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### CELEBORN
auto eth0
iface eth0 inet static
    address 192.223.2.4
    netmask 255.255.255.0
    gateway 192.223.2.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### OROPHER
auto eth0
iface eth0 inet static
    address 192.223.2.5
    netmask 255.255.255.0
    gateway 192.223.2.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### GILGALAD
auto eth0
iface eth0 inet dhcp

echo "nameserver 192.168.122.1" > /etc/resolv.conf



### CELEBRIMBOR
auto eth0
iface eth0 inet static
    address 192.223.2.7
    netmask 255.255.255.0
    gateway 192.223.2.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### PHARAZON
auto eth0
iface eth0 inet static
    address 192.223.2.8
    netmask 255.255.255.0
    gateway 192.223.2.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf



### SWITCH 3 ###

### ERENDIS ### [DNS MASTER]
auto eth0
iface eth0 inet static
    address 192.223.3.3
    netmask 255.255.255.0
    gateway 192.223.3.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### KHAMUL ###
auto eth0
iface eth0 inet static
    address 192.223.3.10
    netmask 255.255.255.0
    gateway 192.223.3.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf

### AMDIR 
auto eth0
iface eth0 inet static
    address 192.223.4.3
    netmask 255.255.255.0
    gateway 192.223.4.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf

### SWITCH 4 ###

### ALDARION ### [DHCP SERVER]
auto eth0
iface eth0 inet static
    address 192.223.4.2
    netmask 255.255.255.0
    gateway 192.223.4.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf

### PALANTIR
auto eth0
iface eth0 inet static
    address 192.223.4.3
    netmask 255.255.255.0
    gateway 192.223.4.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### NARVI
auto eth0
iface eth0 inet static
    address 192.223.4.4
    netmask 255.255.255.0
    gateway 192.223.4.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf


### SWITCH 5 ###
### MINASTIR 
auto eth1
iface eth1 inet static
    address 192.223.5.2
    netmask 255.255.255.0
    gateway 192.223.5.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf




