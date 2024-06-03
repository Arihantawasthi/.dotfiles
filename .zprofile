eval "$(/opt/homebrew/bin/brew shellenv)"

export XDG_CONFIG_HOME=$HOME/.config
export ZDOTDIR="$HOME/.config/zsh"
export HOMEBREW_NO_AUTO_UPDATE=1
export FZF_DEFAULT_COMMAND="find ~/Documents \( -name node_modules -o -name .git -o -name env -o -name .next \) | rg --files --follow ~/Documents"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bindkey -v

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

MENUSELECT=1
zstyle ':complete:*' menu select
zmodload zsh/complist

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
