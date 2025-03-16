# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

export VISUAL=vim
export EDITOR=$VISUAL

ZSH_THEME="agnoster"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git zsh-autosuggestions ssh-agent kubectl)

maybe_shell_file () {
  if [ -f $1 ]; then
    . $1
  fi
}

source $ZSH/oh-my-zsh.sh

# Aliases
maybe_shell_file ~/.aliases
maybe_shell_file ~/.aliases.local

maybe_shell_file ~/.zshrc.local


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# misc binaries
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin

eval "$(zoxide init zsh)"
export PATH="$(yarn global bin):$PATH"


maybe_shell_file $HOME/.cargo/env
