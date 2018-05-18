Ansible Sysop Toolkit
============

This roles helps to install OpenVPN Server across Debian/Ubuntu variants and
consist any roles for management virtual machines across virsh interface.
In addition - role for install mactelnet server.

Plans
-----------
Add roles for install

- NextCloud service
- MySQL service
- PostgreSQL service
- OpenSSL based PKI
- Install base-line utilit's on new servers

Requirements
------------

This role requires Ansible 1.4 or higher, and platform requirements are listed
in the metadata file.

Role Variables
--------------

Roles:

- common				- installation base-line utilit's on new server
- backup-openvpn 			- backup OpenVPN configs from remoute host
- docker-clisp				- install Common Lisp as docker image
- docker-nginx				- install Nginx web server as docker image
- facts-print				- print facts from remoute systems
- install-qemukvm			- install qemu and kvm:-)
- mactelnet-server			- install mactelnet server
- openvpn				- install openvpn and restore config from vackup (see role backup-openvpn)
- virsh-create-vm			- create virtual machine
- virsh-freemem				- print free memory (RAM+swap) on remoute host
- virsh-info-vm				- print information about virtual machines on remoute host
- virsh-list-vm				- print list of virtual machines on remoute host
- virsh-nodeinfo			- print information about virsh node
- virsh-start-vm			- start virtual machine on remoute host with virsh
- aws-create-windows-instance		- create windows instance in amazone
- ssh-client-forward - forwarding local port to remote port on remote host from host with "remoute_login_ip"
- ssh-server-forward - forwarding local server (listening any tcp server process) port to port on remote host

Command examples:

		ansible-playbook -vvv -i mint-hosts/inventory aws-create-windows-instance.yml --limit=localhost --ask-vault-pass

								or

                ansible-playbook -vvv -i mint-hosts/inventory mactelnet-server.yml --ask-vault-pass

NB
roles ssh-client-forward and ssh-server-forward need credanses to access to remoute host "remoute_login_ip" with account "remoute_login"


In catalog mint-hosts, in file mint-hosts/group_vars/all

started_vm 				- name of started virtual machine for role virsh-start-vm, virsh-info-vm
vm_name:				- name of virtual machine, use in role virsh-create-vm
openvpn_volume:				- name of docker volume for storage OpenVPN settings, use in openvpn and backup-openvpn roles
openvpn_address: 			- name of URI , use in openvpn and backup-openvpn roles
openvpn_restore_src: 			- name of dir for storage OpenVPN seting before restore in role openvpn or after backup in backup-openvpn
openvpn_restore_dst: 			- name of dir for storage OpenVPN setting after resore in openvpn role or before backup in backup-openvpn

In catalog localhost, in file mint-hosts/localhost/all

relay: false			- use in role tor. Enabled or disable Tor relay mode
local_port:				- in role ssh-server-forward - tcp port that listened server process. In role ssh-client-forward - define port opening on local host
local_ip:					- in role ssh-server-forward define local ip address that used of forwarding service
remoute_ip:				- in role ssh-client-forward - define remoute ip for remoute port
remoute_port:			- in role ssh-client-forward - define remoute port that mapping to local_ip
remoute_login:		-	remoute login
remoute_login_ip:	- host for remoute login


In catalog kvm-hosts has file vms.yml with kvm virtual machine parameters

In file aws-create-windows-instance.yml

hostname:				- hostname for createing instance
instance_type:				- type of creating instance
image:					- amazone image name
group:					- amazone security group (must be need for allowing access to creating host)
region:					- amazone region (see ec2-describe-regions command from amazone CLI toolkit)
key_pair_name:				- name of using key pair (need for decrypt password from windows instance)a

in file role/aws-create-windows-instance/files/secret set amazone access keys
