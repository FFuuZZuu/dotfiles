#!/bin/bash
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
uim-xim &
export XMODIFIERS=@im=uim
~/.fehbg &
exec dwmbar &
exec picom -b --fade-delta=3 --vsync &
exec dwm
