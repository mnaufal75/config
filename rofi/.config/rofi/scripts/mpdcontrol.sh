
#!/usr/bin/env bash

# rofi-power
# Use rofi to call systemctl for shutdown, reboot, etc

# 2016 Oliver Kraitschy - http://okraits.de
if mpc status|head -2|grep paused;then
    OPTIONS="a\nb\nc\nd\ne\nf"
else
    OPTIONS="z\nb\nc\nd\ne\nf"
fi

# source configuration or use default values
LAUNCHER="rofi -dmenu -i -p mpd -config ~/.config/rofi/themes/1line.rasi "

# Show exit wm option if exit command is provided as an argument
if [ ${#1} -gt 0 ]; then
  OPTIONS="$OPTIONS"
fi

option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $1}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    case $option in
      Exit)
        eval $1
        ;;
        a)
            mpc play
            ;;
        z)
            mpc pause
            ;;
        c)
            mpc play
            ;;
        d)
            mpc prev
            ;;
        e)
            mpc next
            ;;
        f)
            mpc single
            ;;
        g)
            mpc repeat
            ;;
        b)
            mpc random
            ;;
        *)
            ;;
    esac
fi
