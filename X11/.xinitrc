urxvtd -o -q -f
udiskie &
xrdb -merge ~/.config/X11/.Xresources

setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=BackSpace;Shift_L=Escape'&
 
##############################
# Needs to be at end of file #
##############################
exec i3
