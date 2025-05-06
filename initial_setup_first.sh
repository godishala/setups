#!/bin/bash


#Set variables
GITHUB_USER="@username"
REPO_NAME="setup"
CLONE_DIR="$HOME/${REPO_NAME}"
SSH_KEY_PATH="$HOME/.ssh/setup"

mkdir -p $CLONE_DIR

# 1. Generate SSH Key Pair
echo "Generating SSH key pair..."
#ssh-keygen -t ed25519 -C "username@git.com" -f ~/.ssh/setup

# 2. Display the public key for GitHub
echo ""
echo ""
echo "Your SSH public key is:"
cat "$SSH_KEY_PATH"
echo "Copy the above key to your GitHub account."
echo ""
# Instructions to add the SSH key to GitHub
echo ""
echo ""
echo "To add this key to GitHub, follow these steps:"
echo "1. Go to GitHub: https://github.com/settings/keys"
echo "2. Click 'New SSH key'"
echo "3. Paste the public key above into the key field"
echo "4. Add a descriptive title (e.g., 'GitHub SSH Key')"
echo "5. Click 'Add SSH key'"


# 3. Add the private key to the SSH agent for managing keys
echo ""
echo ""
echo "Starting the SSH agent..."
eval "$(ssh-agent -s)"

echo ""
echo ""
echo "Adding the private key to SSH agent..."
ssh-add "$SSH_KEY_PATH"

# 4. Test SSH Connection to GitHub
echo ""
echo ""
echo "Testing SSH connection to GitHub..."
ssh -T git@github.com

echo ""
echo ""
echo "If the above message says 'You've successfully authenticated', you're all set!"
echo ""
echo ""
echo ""
echo ""
# Clone the repository
git clone git@github.com:$GITHUB_USER/$REPO_NAME.git "$CLONE_DIR"

# Result
if [ -d "$CLONE_DIR" ]; then
    echo "Repo cloned successfully into $CLONE_DIR"
else
    echo "Failed to clone repository"
fi

echo ""
echo ""
echo ""
echo ""
echo ""
echo "**********Execute THIS TWO COMMANDS BY HAND EVEN AFTER RUNNING THIS SCRIPT if necessary************"

echo ""
echo 'eval "$(ssh-agent -s)"'
echo 'ssh-add "$HOME/.ssh/setup"'
