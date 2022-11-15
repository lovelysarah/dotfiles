# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bureau"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# For a full list of active aliases, run `alias`.
# Example aliases
alias omz="nvim ~/.oh-my-zsh"

alias rsh="source ~/.zshrc && echo \"Reloaded shell config\""

alias i3rel="i3-msg reload"
alias i3res="i3-msg restart"

# Open configs
alias i3conf="nvim ~/.i3/config";
alias i3bconf="nvim ~/.config/i3blocks"
alias shconf="nvim ~/.zshrc"
alias viconf="nvim ~/.config/nvim/init.vim"
alias tuiconf="nvim ~/.config/spotify-tui/config.yml"


alias nfetch="clear && neofetch --loop on"

alias gla="cd $HOME/dev/glass-showcase"

alias sc="cd ~/.scripts"
alias spt="$HOME/.scripts/spotify.sh"
alias rtree="tree -I 'node_modules|public|build'"

export CARGO="$HOME/.cargo/bin"
export i3_SCRIPT_DIR="$HOME/.config/i3blocks/scripts"

# Dotfile tracking
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

