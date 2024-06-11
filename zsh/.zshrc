eval "$(starship init zsh)"

export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagaced
export EDITOR=nvim

alias cf="cd ~ && cd \$(fd . $HOME/Documents $HOME/.config $HOME/.dotfiles --type d --exclude env --exclude venv2 | fzf)"
alias vf="fd . $HOME/Documents $HOME/.config $HOME/.dotfiles --type f --exclude env --exclude venv2 | fzf | xargs nvim"
alias init="$HOME/.config/zsh/tmux-session-manager"
