#!/bin/bash

set_professional() {
    git config --global user.name "github_Username"
    git config --global user.email "github_Email"
    echo "Switched to Professional."
}

set_burner() {
    git config --global user.name "github_Username"
    git config --global user.email "github_Email"
    echo "Switched to Burner."
}

set_college() {
    git config --global user.name "github_Username"
    git config --global user.email "github_Email"
    echo "Switched to College."
}

# Menu
echo "Select Git profile:"
echo "1) Professional"
echo "2) Burner"
echo "3) College"
read -p "Enter choice [1-3]: " choice

case $choice in
    1) set_professional ;;
    2) set_burner ;;
    3) set_college ;;
    *) echo "Invalid option" ;;
esac
