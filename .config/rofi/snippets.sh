#!/bin/zsh

# menu (dmenu, rofi, fzf, etc.)

snippet_folder=${SNIPPET_FOLDER:-$HOME/.config/rofi}
snippet_db=$snippet_folder/snippets.db

old_clip=$(xclip -selection clipboard -o 2>/dev/null || echo "")

selected=$(sqlite3 -separator $'\t' -newline $'\x0f' $snippet_db 'SELECT s.category, s.name, s.content FROM snippets s' \
| sed -z '$ s/\n/\␤/g' \
| rofi -dmenu -i -sort -matching normal -p Snippets -sep $'\x0f' \
| sed -z '$ s/\␤/\n/g' \
| cut -f3- \
| sed -z 's/\n$//')

# If something was selected, paste it then restore clipboard
if [[ -n "$selected" ]]; then
    echo "$selected" | xclip -selection clipboard
    xdotool key ctrl+shift+v
    sleep 0.1
    echo "$old_clip" | xclip -selection clipboard
fi