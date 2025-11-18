#!/bin/bash

# Ask the user for the tmux session name
read -p "Enter the tmux session name: " SESSION_NAME

# Validate input
if [ -z "$SESSION_NAME" ]; then
    echo "Session name cannot be empty."
    exit 1
fi


# Check if the session already exists
tmux has-session -t "$SESSION_NAME" 2>/dev/null

if [ $? != 0 ]; then
    # Create a new tmux session with two windows
    tmux new-session -d -s "$SESSION_NAME" -n workspace
    tmux new-window -t "$SESSION_NAME":2 -n terminal
fi

tmux select-window -t "$SESSION_NAME":1

tmux attach -t "$SESSION_NAME"
