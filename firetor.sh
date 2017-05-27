NAME=torjail

if brctl show | grep $NAME &> /dev/null
then
  echo "$NAME already exists"
else
  sudo brctl addbr $NAME
  sudo ip link set dev $NAME up
  sudo ip addr add 10.200.1.1/24 dev $NAME
  sudo iptables -t nat -A  PREROUTING -i $NAME -p udp --dport 53 -j REDIRECT --to-ports 5353

  # traffic througth tor
  sudo iptables -t nat -A PREROUTING -i $NAME -p tcp --syn  -j REDIRECT --to-ports 9040    
  sudo iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

firejail --net=$NAME $*
