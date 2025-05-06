#!/bin/bash

HOMEDIR="$HOME/setup/homedir/"
SETBIN="$HOME/setup/bin/"
HBIN="$HOME/bin"
# Update system
if command -v apt > /dev/null; then
	    sudo apt update && sudo apt upgrade -y
	    sudo apt install zsh tmux xsel xclip fzf screenkey -y
elif command -v dnf > /dev/null; then
            sudo dnf update -y
	    sudo dnf install epel-release -y
            sudo dnf install zsh tmux xsel xclip fzf screenkey -y
elif command -v yum > /dev/null; then
            sudo yum update -y
	    sudo yum install epel-release -y
            sudo yum install zsh tmux xsel xclip fzf screenkey -y
fi


# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

rsync -ravz "$HOMEDIR" "$HOME"/
mkdir -p "$HBIN"
rsync -ravz "$SETBIN" "$HBIN"
echo "Setup completed!"

