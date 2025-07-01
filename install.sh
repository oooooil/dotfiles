# install.sh
#!/usr/bin/env bash
set -eu

dotfiles_dir="$HOME"/motiff/dotfiles

More actions
# Initialize SSH directory and setup SSH key
echo "Setting up SSH configuration..."

# Create .ssh directory if it doesn't exist
SSH_DIR="$HOME/.ssh"
if [ ! -d "$SSH_DIR" ]; then
    echo "Creating SSH directory: $SSH_DIR"
    mkdir -p "$SSH_DIR"
fi

# Set correct permissions for .ssh directory
chmod 700 "$SSH_DIR" || echo "Failed to set permissions for $SSH_DIR"

# Check if SSH_KEY_id_ed25519 environment variable is set
if [ -z "${SSH_KEY_ID_ED25519:-}" ]; then
    echo "Warning: SSH_KEY_ID_ED25519 environment variable is not set"
    echo "Skipping SSH key setup"
else
    # Write SSH private key to file
    SSH_KEY_FILE="$SSH_DIR/id_ed25519"
    echo "Writing SSH private key to: $SSH_KEY_FILE"
    echo "$SSH_KEY_ID_ED25519" > "$SSH_KEY_FILE"

    # Set correct permissions for private key file
    chmod 600 "$SSH_KEY_FILE"

    echo "SSH key setup completed successfully"
fi

echo "SSH configuration setup finished"

# Setup zsh configuration
echo "Setting up zsh configuration..."

# Create zsh config directory
ZSH_CONFIG_DIR="$HOME/.config/zsh"
echo "Creating zsh config directory: $ZSH_CONFIG_DIR"

# Set XDG_CONFIG_HOME if not already set
if [[ -z "$XDG_CONFIG_HOME" ]]; then
    export XDG_CONFIG_HOME="$HOME/.config/"
    echo "Set XDG_CONFIG_HOME to: $XDG_CONFIG_HOME"
fi

# Set ZDOTDIR if zsh config directory exists
if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh/"
    echo "Set ZDOTDIR to: $ZDOTDIR"
fi

# Add environment variables to /etc/zprofile
echo "Adding environment variables to /etc/zprofile..."
cat << EOF | sudo tee -a /etc/zprofile > /dev/null

if [[ -z "\$XDG_CONFIG_HOME" ]]
then
        export XDG_CONFIG_HOME="\$HOME/.config/"
fi

if [[ -d "\$XDG_CONFIG_HOME/zsh" ]]
then
        export ZDOTDIR="\$XDG_CONFIG_HOME/zsh/"
fi
EOF

echo "zsh configuration setup completed"



# Install vim on Ubuntu if not exists
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "ubuntu" ] && ! command -v vim >/dev/null 2>&1; then
        echo "Ubuntu system detected and vim not found, installing vim..."
        sudo apt install -y software-properties-common
        sudo add-apt-repository -y ppa:jonathonf/vim
        sudo apt update
        sudo apt install -y vim
        echo "vim installation completed"
    fi
fi

# Install vim configuration
echo "Installing vim configuration..."
curl https://raw.githubusercontent.com/e7h4n/e7h4n-vim/master/bootstrap.sh -L -o - | sh
echo "vim configuration installation completed"

echo "Installing claude code..."
sudo npm install -g @anthropic-ai/claude-code
claude mcp add playwright npx @playwright/mcp@latest


echo "All setup completed successfully!"

