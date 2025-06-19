if test -d /opt/homebrew
    source (/opt/homebrew/bin/brew shellenv)
end

set -U fish_greeting

set -gx EDITOR "vim"
set -gx VISUAL "$EDITOR"

if test -d "$HOME/Work"
    set -gx CDPATH "$HOME/Work"
end

if test -d "/home/apps"
    set -gx CDPATH "/home/apps"
end

abbr g "git"
abbr d "docker"
abbr c "docker compose"

source (starship init fish)
