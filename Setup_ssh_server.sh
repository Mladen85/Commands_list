# Check if ssh server is already installed:
# Method 1: Check if the SSH service is running
sudo systemctl status sshd

# Method 2: Check if the SSH server package is installed
dpkg -l | grep openssh-server

# Method 3: Check if the SSH daemon exists
which sshd
# or
ls /usr/sbin/sshd


# INSTALL
# If SSH is not installed, install it
sudo apt update
sudo apt install openssh-server

# Enable SSH service to start on boot
sudo systemctl enable sshd

# Start the SSH service
sudo systemctl start sshd

# Check the status of the SSH service
sudo systemctl status sshd


# SETUP
# Configure SSH server settings
sudo vim /etc/ssh/sshd_config

# Enable/disable root login
PermitRootLogin no

# Enable/disable password authentication
PasswordAuthentication yes

# Enable/disable public key authentication
PubkeyAuthentication yes

# Save and exit the configuration file

# Restart the SSH service to apply changes
sudo systemctl restart sshd


# TEST
# Test SSH connection from another machine
ssh username@server_ip_address


# CONNECT USING SSH KEY
# Generate ssh key for host machine
#Check if key already exist
ls -la ~/.ssh
#If id_rsa and id_rsa.pub keys do not exist
#generate new keys
ssh-keygen -t rsa -C "<E-mail_address>"
#check if ssh-agent is running
eval "$(ssh-agent -s)"
#Add new genereted key to ssh-agent
ssh-add ~/.ssh/id_rsa

# Enable public key authentication in /etc/ssh/sshd_config file
sudo vim /etc/ssh/sshd_config
PubkeyAuthentication yes

# To transfer public key to server, from host machine run command
ssh-copy-id remote_host

# To enable using alias for ssh, on host machine edit ~/.ssh/config file
# add following configuration
Host remote_server_name
  HostName 192.168.1.1 # ip address
  Port 22 # This field is not needed if default port 22 is used, in case another port is used, specify here
  User remote_server_user_name
  IdentityFile /home/user/.ssh/id_rsa # Set path to Host's private key
  # If Host is using Windows OS, use windows style path: C:\Users\User\.ssh\id_rsa
# Now connect to remote using "ssh remote_server_name" command, and password will not be required
# Same configuration can be used to connect to remote using VS Code
