# Aldarion
## Edit /etc/dhcp/dhcpd.conf - tambahkan lease time:

## Dalam subnet Keluarga Manusia
subnet 192.238.1.0 netmask 255.255.255.0 {
    default-lease-time 1800;
    max-lease-time 3600;
}

## Dalam subnet Keluarga Peri  
subnet 192.238.2.0 netmask 255.255.255.0 {
    default-lease-time 600;
    max-lease-time 3600;

}

service isc-dhcp-server restart

#Client DHCP (Amandil & Gilgalad)

dhclient -r
dhclient -v eth0
