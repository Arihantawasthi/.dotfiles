eval "$(starship init zsh)"

export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagaced

alias vim="nvim"
alias cf="cd ~ && cd \$(fd . $HOME/Documents $HOME/.config $HOME/.dotfiles --type d --exclude env --exclude venv2 | fzf)"
alias vf="fd . $HOME/Documents $HOME/.config $HOME/.dotfiles --type f --exclude env --exclude venv2 | fzf | xargs nvim"
alias init="$HOME/.config/zsh/tmux-session-manager"
alias gpa="git push origin master && git push ghost master"

SCREEN_WIDTH=$(system_profiler SPDisplaysDataType | grep UI | awk '{print $6}')
if [ "$SCREEN_WIDTH" = 1440 ]; then
    export ALACRITTY_FONT_SIZE=16
else
    export ALACRITTY_FONT_SIZE=13
fi
