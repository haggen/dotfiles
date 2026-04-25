if test -d /opt/homebrew; /opt/homebrew/bin/brew shellenv | source; end

set -U fish_greeting

set -gx EDITOR vim
set -gx VISUAL $EDITOR

if test -d ~/Work; set -gx CDPATH ~/Work; end
if test -d /home/apps; set -gx CDPATH /home/apps; end

abbr g git
abbr d docker
abbr c "docker compose"
abbr z zed-preview
abbr v vim

starship init fish | source
