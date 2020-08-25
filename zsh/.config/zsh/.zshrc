export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"
eval "$(starship init zsh)"
eval "$(pyenv init -)"

ZSH_THEME="jbergantine"

plugins=(git zsh-z)

source $ZSH/oh-my-zsh.sh

# alias up="sudo $HOME/config/scripts/scripts/update.sh"
alias up="sudo pacman -Syu"
alias in="sudo pacman -S"
alias sz="source $XDG_CONFIG_HOME/zsh/.zshrc"
alias con="$HOME/config/scripts/scripts/wifi-reconnect.sh"
alias tp="tmuxp load $XDG_CONFIG_HOME/tmuxp/ping.yaml"
alias tw="tmuxp load $XDG_CONFIG_HOME/tmuxp/work.yaml"
alias tmux="tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf"
alias wtr="curl wttr.in/Bandung"
alias vim="nvim"

VBOX_USB=usbfs
