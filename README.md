# Dotfiles

To install on a new machine:

1. Install zsh
2. Install oh-my-zsh (+ plugins)
3. Install Dotfiles

```sh
alias cf='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
git clone --bare git@github.com:eugenenelou/dotfiles.git $HOME/.cfg
cf config --local status.showUntrackedFiles no

# This will override existing files
config checkout
```

