#GIT COMMANDS

#-----------------------------------------------------------------------------------

#Format bash terminal (show branch name in terminal)
#add following lines at the end of ~/.bashrc
#######################
##Start: add branch name in terminal
# Show git branch name
# '\012' - new line (ASCII)
# '\033' - ESC (ASCII)
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[01;31m\] $(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt
##End:   add branch name in terminal
#######################

#Relaod the .bashrc file
source ~/.bashrc

#-----------------------------------------------------------------------------------

# GIT Config

# Add user name and email
git config --global user.name "Name"
git config --global user.email "someone@email.com"
#Or set anonymous E-mail
#In GitHub go to Settings->Emails
#In section Primary email address there is information what E-mail format will be used for web-based Git operations
#<ID>+<User_name>@users.noreply.github.com
git config --global user.email "{ID}+{username}@users.noreply.github.com"
#If previously had configured real email and made commits with that configuration
#  add new commit or amend existing one to update new E-mail
git commit <--amend>

# To fix file name too long run command from GIT Bash as admin
git config --system core.longpaths true

# To manually add configuration use command with flag -e (this open config in editor) 
git config --system -e
git config --global -e

# System Config
[core]
	longpaths = true

# Global Config
[user]
	email = {ID}+{username}@users.noreply.github.com
	name = Name
[core]
	autocrlf = true
	#For Windows use notepad++
	editor = 'C:/LegacyApp/Notepad++/notepad++.exe' -multiInst -notabbar -nosession
	#For Linux use vim
	editor = vim

#Use beyond compare as default compare and merge tool
[diff]
    tool = bc3
[difftool]
    prompt = false
[difftool "bc3"]
    cmd = '/c/Program Files/Beyond Compare 4/BComp.exe' "$LOCAL" "$REMOTE"
	
[merge]
    tool = bc3
[mergetool]
    prompt = false
[mergetool "bc3"]
    cmd = '/c/Program Files/Beyond Compare 4/BComp.exe' "$LOCAL" "$REMOTE" "$BASE" "$MERGED"

#Use vimdiff as default compare and merge tool
[diff]
    tool = vimdiff
[merge]
    tool = vimdiff
	
[filter "lfs"]
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
	required = true
	
[init]
	defaultBranch = master

[fetch]
	prune = true

[alias]
	graph = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'
	graph-all = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
	graph-branch = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --first-parent

#-----------------------------------------------------------------------------------

#Check if key already exist
ls -la ~/.ssh

#If id_rsa and id_rsa.pub keys do not exist, generate new keys
ssh-keygen -t ed25519 -C "your_email@example.com"
#or
ssh-keygen -t rsa -b 4096 -C "<E-mail_address>"

#check if ssh-agent is running
eval "$(ssh-agent -s)"

#Add new genereted key to ssh-agent
ssh-add ~/.ssh/id_rsa

#Copy public key and paste to GitHub
cat ~/.ssh/id_rsa.pub

#Test if key is working
ssh -T git@github.com

#-----------------------------------------------------------------------------------

#Git Init
git init <dir_name>
git remote add origin <git_url>
git add <file>
git commit
git push --set-upstream origin master

#-----------------------------------------------------------------------------------

#Git Clone
git clone <git_url>

#Clone into specific directory
git clone <git_url> <dir_name>

#Clone and recurse into submodules (git versions 1.9 - 2.12)
git clone --recursive <git_url>

#Clone and recurse into submodules (git version 2.13+)
git clone --recurse-submodules <git_url>

#-----------------------------------------------------------------------------------

# Git Workflow on task

# Checkout master branch
git checkout master

# Update information in local repository
# (This will not update files)
git fetch --prune --all

# Check if there are differences between local and remote repository
git status

# If there are differences between local and remote master branch
git pull

# Start working issue

# Create branch for issue, example <branch_name> = feature/issue-id/issue_description or 
git checkout -b <branch_name>

# Do update in code, and check which files are changed
git status

# Add files to staging area
git add <file_name>

# Now commit changes
git commit
# Text editor will open for commit message

# To push branch to remote; flag "--set-upstream" = "-u"
git push -u origin <branch_name>

#-----------------------------------------------------------------------------------

# List all branches (local and remote)
git branch --all

# Rename branch (if renaming current branch, first checkout other branch, e.g. master)
git branch -m old-name new-name

# Show only names of changed files
git diff --name-only [branch, commit...]

# Show names and status of changed files
# Symbol explanation: Added (A), Copied (C), Deleted (D), Modified (M), Renamed (R), have their type (i.e. regular file, symlink, submodule, …​) changed (T), are Unmerged (U), are Unknown (X), or have had their pairing Broken (B).
git diff --name-status [commit, branch, tag...]

# Opens directory differences in difftool
git difftool -d

#To copy file from one branch to another
git checkout master README.md

# Remove branches that doesn't exist on remote
git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done

#Delete local branch
git branch -d <branch-name>

#Force delete local branch
git branch -D <branch-name>

#-----------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------

#Git merge



#If local git repo is added to existing remote repo, it will be considered as two different projects
#Merge can be done using
git pull origin master --allow-unrelated-histories
#or
git merge <branch_name> --allow-unrelated-histories


#-----------------------------------------------------------------------------------

#View commit log
git log

#View log as graph
git log --oneline --graph

#-----------------------------------------------------------------------------------

#

#-----------------------------------------------------------------------------------

#

#-----------------------------------------------------------------------------------
