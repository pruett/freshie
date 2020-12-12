# [~/.\*](https://dotfiles.github.io/)

## Installation

```bash
$ curl https://raw.githubusercontent.com/pruett/dotfiles/master/install | sh
```

### Setup fish shell

Install and setup the fish shell environment:

```bash
$ brew install fish
$ echo `which fish` | sudo tee -a /etc/shells
$ chsh -s `which fish`
```

### Link dotfiles

We'll use [GNU Stow](https://www.gnu.org/software/stow/) to manage our symlinks:

```bash
$ brew install stow
$ stow git neovim # etc.
# remove link anytime
$ stow -D git
```

### Setup neovim

- Run stow, add [minpac package manager](https://github.com/k-takata/minpac), and update packages found in ~/.config/nvim/init.vim

```bash
$ stow neovim
$ git clone git@github.com:k-takata/minpac.git \
    ~/.config/nvim/pack/minpac/opt/minpac
$ nvim
# run :PackClean and :PackUpdate within nvim to install packages
```
