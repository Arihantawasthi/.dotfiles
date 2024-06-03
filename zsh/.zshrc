eval "$(starship init zsh)"

export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagaced

alias cf="cd ~ && cd \$(fd . $HOME/Documents --type d --exclude env --exclude venv2 | fzf)"
alias vf="fd . $HOME/Documents --type f --exclude env --exclude venv2 | fzf | xargs nvim"
alias init="./sessboot"
