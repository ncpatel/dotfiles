xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc
xset +fp $HOME/.fonts
xset fp rehash

xrdb ~/.Xresources
sxhkd &
xsetroot -cursor_name left_ptr
compton &
udiskie &
sh ~/.fehbg &
[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"
cd ~/.config/bspwm/.barScripts
./panel &


exec bspwm -s "$PANEL_FIFO" -p W
