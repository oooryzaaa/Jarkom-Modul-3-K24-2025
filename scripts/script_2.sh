### ALDARION ###

# nano /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 192.223.4.2
    netmask 255.255.255.0
    gateway 192.223.4.1
    dns-nameservers 192.168.122.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf

### ROOT ALDARION 

apt-get update
apt-get install isc-dhcp-server -y

nano /etc/default/isc-dhcp-server

# ISI DENGAN 
INTERFACESv4="eth0"

nano /etc/dhcp/dhcpd.conf

# ISI DENGAN

# Default lease time
default-lease-time 600;
max-lease-time 7200;

authoritative;

# Subnet Keluarga Manusia (192.223.1.0/24)
subnet 192.223.1.0 netmask 255.255.255.0 {
    range 192.223.1.6 192.223.1.34;
    range 192.223.1.68 192.223.1.94;
    option routers 192.223.1.1;
    option broadcast-address 192.223.1.255;
    option domain-name-servers 192.168.122.1;
}

# Subnet Keluarga Peri (192.223.2.0/24)
subnet 192.223.2.0 netmask 255.255.255.0 {
    range 192.223.2.35 192.223.2.67;
    range 192.223.2.96 192.223.2.121;
    option routers 192.223.2.1;
    option broadcast-address 192.223.2.255;
    option domain-name-servers 192.168.122.1;
}

# Subnet Khamul (192.223.3.0/24)
subnet 192.223.3.0 netmask 255.255.255.0 {
    option routers 192.223.3.1;
    option broadcast-address 192.223.3.255;
    option domain-name-servers 192.168.122.1;
}

# Fixed Address untuk Khamul
host Khamul {
    hardware ethernet 08:00:27:aa:bb:cc;  # ganti sesuai hasil `ip a` di Khamul
    fixed-address 192.223.3.95;
}

### DURIN ###
apt-get install isc-dhcp-relay -y

nano /etc/default/isc-dhcp-relay

# ISI DENGAN 
SERVERS="192.223.1.2"
INTERFACES="eth1 eth2 eth3 eth4 eth5"
OPTIONS=""

service isc-dhcp-relay restart

# COBA DENGAN
ip a 