#!/usr/bin/env bash

# Terminate already running bar instances
# killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
# echo "---" | tee -a /tmp/dylansPolybar.log /tmp/dylansPolybar2.log /tmp/dylansPolybar3.log
# polybar dylansBar 2>&1 | tee -a /tmp/dylansPolybar.log & disown
# polybar dylansBar2 2>&1 | tee -a /tmp/dylansPolybar2.log & disown
# polybar dylansBar2 2>&1 | tee -a /tmp/dylansPolybar3.log & disown

# echo "Bars launched..."

# from https://github.com/polybar/polybar/issues/763
(
  flock 200

  killall -q polybar

  while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

  outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)
  tray_output=eDP1

  for m in $outputs; do
    if [[ $m == "HDMI1" ]]; then
        tray_output=$m
    fi
  done

  for m in $outputs; do
    export MONITOR=$m
    export TRAY_POSITION=none
    if [[ $m == $tray_output ]]; then
      TRAY_POSITION=right
    fi

    polybar --reload dylansBar </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
    disown
  done
) 200>/var/tmp/polybar-launch.lock