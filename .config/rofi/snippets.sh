#!/bin/zsh

# menu (dmenu, rofi, fzf, etc.)

snippet_folder=${SNIPPET_FOLDER:-$HOME/.config/rofi}
snippet_db=$snippet_folder/snippets.db

# fetch all snippet records, show menu and copy selection to clipboard
sqlite3 -separator $'\t' -newline $'\x0f' $snippet_db 'SELECT s.category, s.name, s.content FROM snippets s' \
| sed -z '$ s/\n/\␤/g' \
| rofi -dmenu -i -sort -matching normal -p Snippets -sep $'\x0f' \
| sed -z '$ s/\␤/\n/g' \
| cut -f3- \
| sed -z 's/\n$//' \
| xclip -selection c && xdotool key ctrl+shift+v