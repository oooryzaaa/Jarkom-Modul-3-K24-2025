#Erendis

## Edit zone file - tambahkan TXT records
cat >> /etc/bind/k24/k24.com << 'EOF'

; TXT Records
@               IN TXT  "Cincin Sauron menuju Elros"
@               IN TXT  "Aliansi Terakhir menuju Pharazon"
elros           IN TXT  "Cincin Sauron"
pharazon        IN TXT  "Aliansi Terakhir"
EOF

service bind9 restart

# Testing
nslookup www.k24.com 127.0.0.1
nslookup 192.238.3.3 127.0.0.1
nslookup 192.238.3.4 127.0.0.1
nslookup -type=TXT k24.com 127.0.0.1
nslookup -type=TXT elros.k24.com 127.0.0.1
nslookup -type=TXT pharazon.k24.com 127.0.0.1
Amdir - Testing Slave
bash
nslookup www.k24.com 127.0.0.1
nslookup 192.238.3.3 127.0.0.1
nslookup 192.238.3.4 127.0.0.1
nslookup -type=TXT k24.com 127.0.0.1
nslookup -type=TXT elros.k24.com 127.0.0.1
nslookup -type=TXT pharazon.k24.com 127.0.0.1
