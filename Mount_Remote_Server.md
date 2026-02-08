# How to mount remote server path to local PC

In order to use local tools on remote server (like compare tools, etc.) best practice is to use **SSHFS** (Secure Shell File System).

## Setup

1. Install SSHFS on Debian/Ubuntu distros
```bash
sudo apt update
sudo apt install sshfs
```

2. Mount remote project
```bash
mkdir -p ~/remote_projects/my_server_repo
sshfs user@your-server-ip:/path/to/git/repo ~/remote_projects/my_server_repo
```

3. Configure Git locally to use Beyond Compare
```bash
git config --global diff.tool bc
git config --global difftool.bc.path "/usr/bin/bcompare"
git config --global difftool.prompt false
```

4. Run the Diff
```bash
cd ~/remote_projects/my_server_repo
git difftool
```
