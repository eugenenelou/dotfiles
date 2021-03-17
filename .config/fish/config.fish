# Remove greeting message
set -U fish_greeting
set -Ux VISUAL vim
set -Ux EDITOR $VISUAL

if test -e ~/.env
  # export env variables from a standard format
  export (grep "^[^#]" ~/.env | xargs -L 1)
end
