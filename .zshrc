# Path to your oh-my-zsh installation.
export ZSH="/home/eugene/.oh-my-zsh"
export VISUAL=vim
export EDITOR=$VISUAL

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

HIST_STAMPS="yyyy-mm-dd"

# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

#turn on tab completion and make it fancy
autoload -Uz compinit && compinit -i

#add custom functions to path (important for prompt)
fpath=(~/.zsh/functions $fpath)

# Load aliases
. ~/.aliases

