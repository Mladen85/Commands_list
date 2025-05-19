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