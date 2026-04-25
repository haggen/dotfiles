#!/usr/bin/env sh

set -ue

if test -d ~/.dotfiles; then
    git -C ~/.dotfiles pull --rebase
else
    git clone --depth=1 https://github.com/haggen/dotfiles.git ~/.dotfiles
    ln -s ~/.dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
    ln -s ~/.dotfiles/.config/starship.toml ~/.config/starship.toml
    ln -s ~/.dotfiles/.vimrc ~/.vimrc
fi

# vim-sleuth is an indentation detection plugin.
if test -d ~/.vim/pack/tpope/start/sleuth; then
  git -C ~/.vim/pack/tpope/start/sleuth pull --rebase
else
    mkdir -p ~/.vim/pack/tpope/start
    git clone --depth=1 https://tpope.io/vim/sleuth.git ~/.vim/pack/tpope/start/sleuth
fi

if test -d ~/.tmux; then
    git -C ~/.tmux pull --rebase
else
    git clone --depth=1 https://github.com/gpakosz/.tmux.git ~/.tmux
    ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
    cp -n ~/.tmux/.tmux.conf.local ~/.tmux.conf.local
fi
