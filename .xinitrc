#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

export PATH=/home/yuto/Android/Sdk/platform-tools/:$PATH
export PATH=/home/yuto/.gradle/wrapper/dists/gradle-4.4-all/9br9xq1tocpiv8o6njlyu5op1/gradle-4.4/bin/:$PATH

xsetroot -cursor_name left_ptr
setxkbmap -layout jp
syndaemon -i 0.5 -t -k &

compton -CGb
stalonetray &
nm-applet &

# exec budgie-desktop
# exec gnome-session
exec xmonad
# exec startdde
