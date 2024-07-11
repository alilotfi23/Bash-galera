# MariaDB Galera Cluster Setup Script

This project provides a Bash script to configure and set up a MariaDB Galera Cluster with options for 2 to 5 nodes. The script automates the configuration of `/etc/hosts` and MariaDB settings for each node in the cluster.

## Features

- Configures `/etc/hosts` with the IP addresses, hostnames, and host aliases of the nodes.
- Updates MariaDB configuration for Galera cluster settings.
- Option to specify which node is the MASTER node.
- Restarts the MariaDB service and displays the status.

## Prerequisites

- Bash shell
- MariaDB installed on all nodes
- Galera plugin for MariaDB

## Usage

1. **Clone the repository**:
   ```sh
   git clone https://github.com/alilotfi23/Bash-galera.git
   cd Bash-galera
   ```

2. **Make the script executable**:
   ```sh
   chmod +x setup_galera_cluster.sh
   ```

3. **Run the script**:
   ```sh
   ./galera.sh
   ```

## Script Breakdown

### Function: `node2()`

- Prompts for the IP, hostname, and host alias of two nodes.
- Appends these details to `/etc/hosts`.
- Configures MariaDB for the Galera cluster.
- Restarts MariaDB and displays the service status.

### Function: `node3()`

- Prompts for the IP, hostname, and host alias of three nodes.
- Appends these details to `/etc/hosts`.
- Configures MariaDB for the Galera cluster.
- Restarts MariaDB and displays the service status.

### Function: `node4()`

- Prompts for the IP, hostname, and host alias of four nodes.
- Appends these details to `/etc/hosts`.
- Configures MariaDB for the Galera cluster.
- Restarts MariaDB and displays the service status.

### Function: `node5()`

- Prompts for the IP, hostname, and host alias of five nodes.
- Appends these details to `/etc/hosts`.
- Configures MariaDB for the Galera cluster.
- Restarts MariaDB and displays the service status.

### Node Selection

- The script provides a menu to select the number of nodes for the cluster.
- Based on the selection, the corresponding function (`node2`, `node3`, `node4`, or `node5`) is called.

### Example Menu

```sh
PS3="Select node count: "

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
```

## Conclusion

This script simplifies the setup process for a MariaDB Galera Cluster by automating the configuration of multiple nodes. Ensure you have the necessary prerequisites installed before running the script.
