# start new tmux session
$ tmux

# List tmux sessions
$ tmux ls

# Attach to existing session (firs one from list)
$ tmux a

# Kill all sessions
$ tmux kill-server

# Kill existing session
$ tmux kill-session -t 0

# Create new tmux session named "ramp-up"
$ tmux new -s ramp-up

# Kill temux session named "ramp-up"
$ tmux kill-session -t ramp-up

# Rename session (first attach to targeted session)
$ tmux rename-session new-name

# Reattach to specific session
tmux attach -t <session_id>
