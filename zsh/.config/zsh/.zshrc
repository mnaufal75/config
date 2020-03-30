export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/mnaufal75/Project/git_modules/.oh-my-zsh"

ZSH_THEME="random"

plugins=(git zsh-z)

source $ZSH/oh-my-zsh.sh

# alias up="sudo $HOME/config/scripts/scripts/update.sh"
alias up="sudo pacman -Syu"
alias sz="source $XDG_CONFIG_HOME/zsh/.zshrc"
alias con="$HOME/config/scripts/scripts/wifi-reconnect.sh"
alias tp="tmuxp load $XDG_CONFIG_HOME/tmuxp/ping.yaml"
alias tw="tmuxp load $XDG_CONFIG_HOME/tmuxp/work.yaml"
alias tmux="tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf"
alias wtr="curl wttr.in/Bandung"
alias vim="nvim"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source /usr/share/fzf/completion.zsh
# source /usr/share/fzf/key-bindings.zsh
