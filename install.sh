#!/bin/zsh

set -e # Exit if a command exists with a non-zero status

if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating Homebrew..."
brew update

echo "Installing required packages"
brew install neovim tmux starhip alacritty aerospace


echo "Creating symlinks..."
ln -sf ~/.dotfiles/tmux ~/.config/tmux
ln -sf ~/.dotfiles/alacritty ~/.config/alacritty
ln -sf ~/.dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/zsh ~/.config/zsh
ln -sf ~/.dotfiles/aerospace.toml ~/.config/aerospace.toml

echo "Dotfiles installation complete! Restart your terminal for changes to take effect."
