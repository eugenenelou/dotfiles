# Dotfiles

To install on a new machine:

1. Install zsh
2. Install oh-my-zsh (+ plugins)
3. Install Dotfiles

```sh
alias cf='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
git clone --bare git@github.com:eugenenelou/dotfiles.git $HOME/.cfg
cf config --local status.showUntrackedFiles no

# This will override existing files and reset the configuration
cf checkout
```

# Dotfiles local

Follow these instructions to extend the base dotfiles config with a local dotfile config repository that you may want to keep private

```sh
dotfiles_local=xxx
alias cfl='/usr/bin/git --git-dir=$HOME/.cfg.local/ --work-tree=$HOME'
git clone --bare $dotfiles_local $HOME/.cfg.local
cf-local config --local status.showUntrackedFiles no

# This will override existing files and reset the local configuration
cfl checkout
```

# To Do

- create a `install.sh` script
