#echo '---' | tee -a /tmp/polybar1.log
#polybar bar 2>&1 | tee -a /tmp/polybar1.log & disown

#echo 'Bar launched...'

# Launch Polybar on all connected monitors
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bar &
  done
else
  polybar --reload bar &
fi
