# Dotfiles

To install on a new machine run:

```sh
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
git clone --separate-git-dir=$HOME/.cfg  $HOME/myconf-tmp
rm -r ~/myconf-tmp

# This will override existing files
config checkout
```
