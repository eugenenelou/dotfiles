# Dotfiles

This repository is made to store configuration files in a headless git repository.

The usage is as simple as git, just replace the `git` command by `cf` and use it to add any file from
your `$HOME` directory. For obvious reasons, untracked files are not shown by `cf status`.

Example:

```
cf add ~/.gitignore
cf commit -m "add global .gitignore
cf push origin master
```

# Installation

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
**Warning** The _README.md_ file is shared between the main and the secondary dotfile repositories.

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
