#!/bin/bash

# Banner
echo "
███████╗██╗   ██╗███████╗███████╗███╗   ██╗██╗   ██╗███╗   ███╗
██╔════╝╚██╗ ██╔╝██╔════╝██╔════╝████╗  ██║██║   ██║████╗ ████║
███████╗ ╚████╔╝ ███████╗█████╗  ██╔██╗ ██║██║   ██║██╔████╔██║
╚════██║  ╚██╔╝  ╚════██║██╔══╝  ██║╚██╗██║██║   ██║██║╚██╔╝██║
███████║   ██║   ███████║███████╗██║ ╚████║╚██████╔╝██║ ╚═╝ ██║
╚══════╝   ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝
                                                               " 
echo "
  ___          _  _   _                   ___ _                        
 | _ )_  _    /_\| |_| |_  __ _ _ ___ __ / __| |_  __ _ _ _ _ __  __ _ 
 | _ \ || |  / _ \  _| ' \/ _` | '_\ V / \__ \ ' \/ _` | '_| '  \/ _` |
 |___/\_, | /_/ \_\__|_||_\__,_|_|  \_/  |___/_||_\__,_|_| |_|_|_\__,_|
      |__/                                                             
"

# Define the output and log files
output_file="sys_enum.txt"
log_file="sys_enum.log"

# Create or clear the output and log files
> $output_file
> $log_file

# Define the commands to be run
commands=(
  "cat /etc/issue"
  "cat /etc/*-release"
  "cat /etc/lsb-release"
  "cat /etc/redhat-release"
  "cat /proc/version"
  "uname -a"
  "uname -mrs"
  "env"
  "set"
  "cat /etc/profile"
  "cat /etc/bashrc"
  "cat ~/.bash_profile"
  "cat ~/.bashrc"
  "cat ~/.bash_logout"
  "cat ~/.zshrc"
  "ps aux"
  "ps -elf"
  "crontab -l"
  "cat /etc/cron*"
  "cat /etc/cron.d/*"
  "cat /etc/cron.daily/*"
  "cat /etc/cron.hourly/*"
  "cat /etc/cron.monthly/*"
  "cat /etc/crontab"
  "cat /etc/at.allow"
  "cat /etc/at.deny"
  "cat /etc/anacrontab"
  "cat /etc/resolv.conf"
  "cat /etc/sysconfig/network"
  "cat /etc/networks"
  "iptables -L"
  "hostname"
  "dnsdomainname"
  "netstat -antup"
  "netstat -antpx"
  "netstat -tulpn"
  "chkconfig --list"
  "chkconfig --list | grep 3:on"
)

# Function to run a command and log output
run_command() {
  local cmd="$1"
  local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  
  echo "[$timestamp] Running: $cmd" >> $log_file
  echo "Running: $cmd" >> $output_file
  if eval "$cmd" >> $output_file 2>> $log_file; then
    echo "[$timestamp] Success: $cmd" >> $log_file
  else
    echo "[$timestamp] Error: $cmd" >> $log_file
  fi
  echo -e "\n------------------------------\n" >> $output_file
}

# Run each command and log output
for cmd in "${commands[@]}"; do
  run_command "$cmd"
done

echo "System enumeration complete. Output saved to $output_file and logs to $log_file."
