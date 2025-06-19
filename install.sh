#!/usr/bin/env bash

now=$(date +%s)
git clone https://github.com/haggen/dotfiles.git "$HOME/.dotfiles"

sources=(
    "$HOME/.dotfiles/.config/fish/config.fish"
    "$HOME/.dotfiles/.config/starship.toml"
)

for source in "${sources[@]}"; do
    target="$HOME/${source#"$HOME/.dotfiles/"}"

    if test -f "$target"; then
        mv "$target" "$target.$now"
    elif ! test -d "$(dirname "$target")"; then
        mkdir -p "$(dirname "$target")"
    fi

    ln -s "$source" "$target"
done