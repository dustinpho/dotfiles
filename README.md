# dotfiles

My personal dotfiles, managed using [chezmoi](https://www.chezmoi.io/).

## Setup
Install chezmoi and clone my dotfile repository.
```
brew install chezmoi
chezmoi init --apply https://gitlab.com/dustinpho/dotfiles.git
```

This installs packages and dependencies, and also stages my tmux, zsh, and vim setups. This will call `run_once_after_install.py` under the hood.
```
chezmoi apply
```

## To make changes to dotfiles
To edit an existing dotfile:
```
chezmoi edit ~/.existingrc
```

To add a new dotfile:
```
chezmoi add ~/.newrc
```

## To commit changes
```
chezmoi cd
git add --all
git commit -m "commit message"
git push -u origin master
```
