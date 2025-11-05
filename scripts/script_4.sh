Erendis (DNS Master)
## Install bind9
apt update && apt-get install bind9 bind9utils -y

## Konfigurasi options
cat > /etc/bind/named.conf.options << EOF
options {
    directory "/var/cache/bind";
    forwarders {
        192.238.5.2;
    };
    dnssec-validation no;
    listen-on { any; };
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
    recursion yes;
};
EOF

## Konfigurasi local
cat > /etc/bind/named.conf.local << EOF
zone "k24.com" {
    type master;
    notify yes;
    also-notify { 192.238.3.4; };
    allow-transfer { 192.238.3.4; };
    file "/etc/bind/k24/k24.com";
};

zone "3.238.192.in-addr.arpa" {
    type master;
    notify yes;
    also-notify { 192.238.3.4; };
    allow-transfer { 192.238.3.4; };
    file "/etc/bind/k24/192.238.3.rev";
};
EOF

## Buat direktori
mkdir /etc/bind/k24

## Buat zone file forward
cat > /etc/bind/k24/k24.com << 'EOF'
$TTL 604800
@       IN SOA  ns1.k24.com. root.k24.com. (
                        2025103001
                        604800
                        86400
                        2419200
                        604800 )

        IN NS   ns1.k24.com.
        IN NS   ns2.k24.com.

@       IN A    192.238.3.3
ns1     IN A    192.238.3.3
ns2     IN A    192.238.3.4

palantir        IN A    192.238.4.3
elros           IN A    192.238.1.7
pharazon        IN A    192.238.2.4
elendil         IN A    192.238.1.2
isildur         IN A    192.238.1.3
anarion         IN A    192.238.1.4
galadriel       IN A    192.238.2.5
celeborn        IN A    192.238.2.6
oropher         IN A    192.238.2.7

www     IN CNAME        k24.com.
EOF

## Buat zone file reverse
cat > /etc/bind/k24/192.238.3.rev << 'EOF'
$TTL 604800
@       IN SOA  ns1.k24.com. root.k24.com. (
                        2025103001
                        604800
                        86400
                        2419200
                        604800 )

; Name Servers
        IN NS   ns1.k24.com.
        IN NS   ns2.k24.com.

; PTR Records
3       IN PTR  ns1.k24.com.
4       IN PTR  ns2.k24.com.
EOF

# Start service
service bind9 start

# Testing
nslookup k24.com 127.0.0.1
nslookup palantir.k24.com 127.0.0.1
Amdir (DNS Slave)
# Install bind9
apt update && apt-get install bind9 bind9utils -y

# Konfigurasi local
cat > /etc/bind/named.conf.local << EOF
zone "k24.com" {
    type slave;
    masters { 192.238.3.3; };
    file "/var/cache/bind/k24.com";
};

zone "3.238.192.in-addr.arpa" {
    type slave;
    masters { 192.238.3.3; };
    file "/var/cache/bind/192.238.3.rev";
};
EOF

# Start service
service bind9 start

# Testing
nslookup k24.com 127.0.0.1
nslookup ns1.k24.com 127.0.0.1
Aldarion (DHCP Server)
bash
# Edit /etc/dhcp/dhcpd.conf - ganti domain-name-servers menjadi 192.238.5.2
service isc-dhcp-server restart
Minastir (DNS Forwarder)
bash
# Konfigurasi options
cat > /etc/bind/named.conf.options << 'EOF'
options {
    directory "/var/cache/bind";
    forwarders {
        192.238.3.3;
        192.238.3.4;
        8.8.8.8;
    };
    forward only;
    dnssec-validation no;
    listen-on { any; };
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
    recursion yes;
};
EOF

service bind9 restart
DHCP Client (Amandil & Gilgalad)
bash
apt-get update && apt-get install isc-dhcp-client -y
dhclient -r
dhclient eth0

# Testing
nslookup k24.com
nslookup palantir.k54.com
nslookup ns1.k54.com
Amdir - Verifikasi Slave
bash
ls -la /var/cache/bind/
nslookup k24.com 127.0.0.1
nslookup ns1.k24.com 127.0.0.1
nslookup palantir.k24.com 127.0.0.1
