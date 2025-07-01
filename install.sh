# install.sh
#!/usr/bin/env bash
set -eu

dotfiles_dir="$HOME"/motiff/dotfiles

# install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy zsh config
ln -sf $dotfiles_dir/.zshrc $HOME/.zshrc
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

