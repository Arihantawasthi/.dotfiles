# Dotfiles
This repository contains my personal configuration files (dotfiles) for setting up a productive development environment on **macOS**. These configurations help streamline workflows, improve efficiency and ensure consistency across different setups.


## 🚀 Features
- Pre-configured environment for coding and productivity.
- Automated setup using Homebrew.
- Modular and easily customizable dotfiles.


## 📦 Packages Used
The following packages are being used by this configuration and will be installed via Homebrew.
- `nvim` - Modern Vim-based text editor.
- `tmux` - Terminal multiplexer.
- `starship` - Minimal, fast, and customizable prompt.
- `alacritty` - GPU-accelerated terminal emulator.
- `aerospace` -  i3-like tiling window manager for macOS


## 📥 Installation
To set up these dotfiles on your macOS system, you can clone the repository and run the installation script:
```
# Clone the repository
git clone https://github.com/dotfiles.git ~/.dotfiles

# Run the setup script
cd ~/.dotfiles
./install.sh
```


## 🎨 Customization
These dotfiles are modular, meaning you can tweak or extend them based on your workflow. Feel free to fork or modify them to suit your needs. You can add custom settings by modifying the respective configuration files in `~/.dotfiles/`.


## 🛠️ Troubleshooting
NOTE: This repo assumes that your system is using zsh
If the installation script fails for any reason, you can manually install the necessary packages and set up the configurations:
```
brew install neovim tmux starship alacritty aerospace
```

Then, manually link the configuration files as shown below.
```
ln -sf ~/.dotfiles/tmux ~/.config/tmux
ln -sf ~/.dotfiles/alacritty ~/.config/alacritty
ln -sf ~/.dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/zsh ~/.config/zsh
ln -sf ~/.dotfiles/aerospace.toml ~/.config/aerospace.toml
```


## 📜 License
Feel free to use and modify these dotfiles. However, if you find them useful, a shoutout would be appreciated! 🚀
