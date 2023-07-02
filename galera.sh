#!/bin/bash

node2()

{

read -p "Enter Your ip-(node1) & hostname & hostalias : " ip1 h10 h100
read -p "Enter Your ip-(node2) & hostname & hostalias : " ip2 h20 h200

cat << EOF >> /etc/hosts
$ip1  $h10 $h100
$ip2  $h20 $h200

EOF

echo -e "\e[93m////////////////////////////////////////////////////////////////\e[39m"
sed -n -e 10p -e 11p -e 12p -e 13p -e 14p -e 15p -e 16p -e 17p /etc/hosts
echo -e "\e[93m///////////////////////////////////////////////////////////////\e[39m"
echo -e "\n"
read -p "This node which your node (node1 or node2) : " name

sed -e '/bind-address/ s/^#*/#/' -i /etc/mysql/mariadb.conf.d/50-server.cnf

cat << EOF >> /etc/mysql/mariadb.conf.d/50-server.cnf
[galera]
wsrep_on                 = ON
wsrep_cluster_name       = "MariaDB Galera Cluster"
wsrep_provider           = /usr/lib/galera/libgalera_smm.so
wsrep_cluster_address    = "gcomm://"
binlog_format            = row
default_storage_engine   = InnoDB
innodb_autoinc_lock_mode = 2
bind-address = 0.0.0.0
wsrep_node_address="$name"
EOF
echo -e "\n"
read -p "Is this node your MASTER node (y/n) " ans
if [[ $ans == "y" ]]; then
  sudo galera_new_cluster
else
 sed -e '/wsrep_cluster_address/ s/^#*/#/' -i /etc/mysql/mariadb.conf.d/50-server.cnf
 sed -i  '139 a wsrep_cluster_address    = "gcomm://node1,node2"' /etc/mysql/mariadb.conf.d/50-server.cnf

fi
echo $(sudo systemctl restart mariadb)
echo -e "\n"
VAR=$(systemctl status mariadb.service   | grep Active | gawk -F ':' '{print $2}' | sed 's/ //g' | sed -e 's/\(^.*(\)\(.*\)\().*$\)/\2/')
echo -e "Your mariadb service status is: "
echo -e "\e[93m$VAR\e[39m"
echo -e "\n"
}

node3 ()

{

read -p "Enter Your ip-(node1) & hostname & hostalias : " ip1 h10 h100
read -p "Enter Your ip-(node2) & hostname & hostalias : " ip2 h20 h200
read -p "Enter Your ip-(node3) & hostname & hostalias : " ip3 h30 h300

cat << EOF >> /etc/hosts
$ip1  $h10 $h100
$ip2  $h20 $h200
$ip3  $h30 $h300
EOF


echo -e "\e[93m////////////////////////////////////////////////////////////////\e[39m"
sed -n -e 10p -e 11p -e 12p -e 13p -e 14p -e 15p -e 16p -e 17p /etc/hosts
echo -e "\e[93m////////////////////////////////////////////////////////////////\e[39m"
echo -e "\n"

read -p "This node which your node (node1,node2,node3) : " name

sed -e '/bind-address/ s/^#*/#/' -i /etc/mysql/mariadb.conf.d/50-server.cnf

cat << EOF >> /etc/mysql/mariadb.conf.d/50-server.cnf
[galera]
wsrep_on                 = ON
wsrep_cluster_name       = "MariaDB Galera Cluster"
wsrep_provider           = /usr/lib/galera/libgalera_smm.so
wsrep_cluster_address    = "gcomm://"
binlog_format            = row
default_storage_engine   = InnoDB
innodb_autoinc_lock_mode = 2
bind-address = 0.0.0.0
wsrep_node_address="$name"
EOF

echo -e "\n"
read -p "Is this node your MASTER node (y/n) " ans
if [[ $ans == "y" ]]; then
  sudo galera_new_cluster
else
 sed -e '/wsrep_cluster_address/ s/^#*/#/' -i /etc/mysql/mariadb.conf.d/50-server.cnf
 sed -i  '139 a wsrep_cluster_address    = "gcomm://node1,node2,node3"' /etc/mysql/mariadb.conf.d/50-server.cnf

fi

echo $(sudo systemctl restart mariadb)
echo -e "\n"
VAR=$(systemctl status mariadb.service   | grep Active | gawk -F ':' '{print $2}' | sed 's/ //g' | sed -e 's/\(^.*(\)\(.*\)\().*$\)/\2/')
echo -e "Your mariadb service status is: "
echo -e "\e[93m$VAR\e[93m"
echo -e "\n"

}

node4()

{

read -p "Enter Your ip-(node1) & hostname & hostalias : " ip1 h10 h100
read -p "Enter Your ip-(node2) & hostname & hostalias : " ip2 h20 h200
read -p "Enter Your ip-(node1) & hostname & hostalias : " ip3 h30 h300
read -p "Enter Your ip-(node2) & hostname & hostalias : " ip4 h40 h400

cat << EOF >> /etc/hosts
$ip1  $h10 $h100
$ip2  $h20 $h200
$ip3  $h30 $h300
$ip4  $h40 $h400
EOF

echo -e "\e[93m////////////////////////////////////////////////////////////////\e[39m"
sed -n -e 10p -e 11p -e 12p -e 13p -e 14p -e 15p -e 16p -e 17p /etc/hosts
echo -e "\e[93m////////////////////////////////////////////////////////////////\e[39m"
echo -e "\n"

read -p "This node which your node (node1,node2,node3,node4) : " name

sed -e '/bind-address/ s/^#*/#/' -i /etc/mysql/mariadb.conf.d/50-server.cnf

cat << EOF >> /etc/mysql/mariadb.conf.d/50-server.cnf
[galera]
wsrep_on                 = ON
wsrep_cluster_name       = "MariaDB Galera Cluster"
wsrep_provider           = /usr/lib/galera/libgalera_smm.so
wsrep_cluster_address    = "gcomm://"
binlog_format            = row
default_storage_engine   = InnoDB
innodb_autoinc_lock_mode = 2
bind-address = 0.0.0.0
wsrep_node_address="$name"
EOF

echo -e "\n"

read -p "Is this node your MASTER node (y/n) " ans

if [[ $ans == "y" ]]; then
  sudo galera_new_cluster
else
 sed -e '/wsrep_cluster_address/ s/^#*/#/' -i /etc/mysql/mariadb.conf.d/50-server.cnf
 sed -i  '139 a wsrep_cluster_address    = "gcomm://node1,node2,node3,node4"' /etc/mysql/mariadb.conf.d/50-server.cnf
fi

echo $(sudo systemctl restart mariadb)

echo -e "\n"

VAR=$(systemctl status mariadb.service   | grep Active | gawk -F ':' '{print $2}' | sed 's/ //g' | sed -e 's/\(^.*(\)\(.*\)\().*$\)/\2/')

echo -e "Your mariadb service status is: "

echo -e "\e[93m$VAR\e[93m"

echo -e "\n"

}

node5()

{

read -p "Enter Your ip-(node1) & hostname & hostalias : " ip1 h10 h100
read -p "Enter Your ip-(node2) & hostname & hostalias : " ip2 h20 h200
read -p "Enter Your ip-(node1) & hostname & hostalias : " ip3 h30 h300
read -p "Enter Your ip-(node2) & hostname & hostalias : " ip4 h40 h400
read -p "Enter Your ip-(node2) & hostname & hostalias : " ip5 h50 h500

cat << EOF >> /etc/hosts
$ip1  $h10 $h100
$ip2  $h20 $h200
$ip3  $h30 $h300
$ip4  $h40 $h400
$ip5  $h50 $h500
EOF

echo -e "\e[93m////////////////////////////////////////////////////////////////\e[39m"
sed -n -e 10p -e 11p -e 12p -e 13p -e 14p -e 15p -e 16p -e 17p /etc/hosts
echo -e "\e[93m////////////////////////////////////////////////////////////////\e[39m"
echo -e "\n"

read -p "This node which your node (node1,node2,node3,node4,node5) : " name

sed -e '/bind-address/ s/^#*/#/' -i /etc/mysql/mariadb.conf.d/50-server.cnf

cat << EOF >> /etc/mysql/mariadb.conf.d/50-server.cnf
[galera]
wsrep_on                 = ON
wsrep_cluster_name       = "MariaDB Galera Cluster"
wsrep_provider           = /usr/lib/galera/libgalera_smm.so
wsrep_cluster_address    = "gcomm://"
binlog_format            = row
default_storage_engine   = InnoDB
innodb_autoinc_lock_mode = 2
bind-address = 0.0.0.0
wsrep_node_address="$name"
EOF

echo -e "\n"

read -p "Is this node your MASTER node (y/n) " ans

if [[ $ans == "y" ]]; then

  sudo galera_new_cluster

else
 sed -e '/wsrep_cluster_address/ s/^#*/#/' -i /etc/mysql/mariadb.conf.d/50-server.cnf

 sed -i  '139 a wsrep_cluster_address    = "gcomm://node1,node2,node3,node4,node5"' /etc/mysql/mariadb.conf.d/50-server.cnf
fi

echo $(sudo systemctl restart mariadb)

echo -e "\n"

VAR=$(systemctl status mariadb.service   | grep Active | gawk -F ':' '{print $2}' | sed 's/ //g' | sed -e 's/\(^.*(\)\(.*\)\().*$\)/\2/')

echo -e "Your mariadb service status is: "

echo -e "\e[93m$VAR\e[93m"

echo -e "\n"

}

PS3="Selcet node count: "

select choice in "2node" "3node"  "4node" "5node"  "Exit"

do

case $REPLY in

1)
node2
;;
2)
node3
;;
3)
node4
;;
4)
node5
;;
5)
echo "...Bye..."
exit 0
;;
*)
echo "Invalid Choice"

esac

done
