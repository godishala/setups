#!/bin/bash

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
if ! command -v zsh > /dev/null; then
	echo "Zsh not found, installing..."
	if command -v apt > /dev/null; then
		sudo apt install zsh -y
	elif command -v dnf > /dev/null; then
		sudo dnf install zsh -y
	elif command -v yum > /dev/null; then
		sudo yum install zsh -y
	fi
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Rsync homedir setup
rsync -ravz ~/setup/homedir/* ~/
rsync -ravz ~/setup/homedir/.* ~/

# Rsync bin setup
mkdir -p ~/bin

rsync -ravz ~/setup/bin/* ~/bin
rsync -ravz ~/setup/bin/.* ~/bin

# Setup fzf key-bindings and completion for zsh
#echo "source /usr/share/doc/fzf/examples/key-bindings.zsh" >> ~/.zshrc_alias
#echo "source /usr/share/doc/fzf/examples/completion.zsh" >> ~/.zshrc_alias

echo "Setup completed!"

