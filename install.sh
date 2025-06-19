#!/usr/bin/env sh

now=$(date +%s)
git clone https://github.com/haggen/dotfiles.git "$HOME/.dotfiles"

find "$HOME/.dotfiles" -type f; while read -r file; do
    target="$HOME/${file#"$HOME/.dotfiles/"}"
    if test -f "$target"; then
        cp -p "$target" "$target.$now"
    fi
    ln -s "$file" "$target"
done