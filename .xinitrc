#!/bin/sh

# Disable beeping.
xset -b

# Disable screensaver but turn off monitor after a period of inactivity.
xset s off
xset dpms 0 0 900

# Turn on Scroll/Num locks.
xset led named Scroll\ Lock
numlockx

# Launch i3.
exec i3
