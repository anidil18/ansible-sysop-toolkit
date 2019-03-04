#!/usr/bin/env bash
if [ -z "$1" ]
	then
		echo "Usage: scan.bash 192.168.1.0 24 for scan 192.168.10/24"
	exit 1
fi
export ANSIBLE_HOST_KEY_CHECKING=False
echo "[all]" > ./inventary
nmap -F $1/$2 |grep  -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" >> ./inventary
ansible-playbook -i ./inventary scan_zabbix_agent.yml |grep "Zabbix agent not faund"
if [ -z "$3" ] && [ "$3" = "--not-remove-inventary" ]
	then	
		rm -f ./inventary
	fi
