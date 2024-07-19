# SysEnum: System Enumeration Script for Linux
This script automates the collection of system information on a Linux machine, running a series of commands to gather details about the system's configuration, environment, and network settings. The results are saved in a sys_enum.txt file, with separate logging of the command execution in a sys_enum.log file.

## Features
- Collects system version and architecture information.
- Retrieves environment variables and shell configuration files.
- Lists running processes and cron jobs.
- Displays network settings and iptables rules.
- Logs each command execution with timestamps and error handling.

## Usage
### Prerequisites
Ensure you have the necessary permissions to execute system commands and read system files.

### Installation
Clone the repository to your local machine:
```bash
git clone https://github.com/yourusername/sysenum.git
cd sysenum
chmod +x sysenum.sh
./sysenum
