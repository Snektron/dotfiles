Setup:
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/Snektron/dotfiles $HOME/dotfiles-tmp
rm -r ~/dotfiles-tmp/
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config status.showUntrackedFiles no
```
