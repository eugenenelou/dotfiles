# Path to your oh-my-zsh installation.
export ZSH="/home/eugene/.oh-my-zsh"

export VISUAL=vim
export EDITOR=$VISUAL

ZSH_THEME="agnoster"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Aliases
. ~/.aliases
