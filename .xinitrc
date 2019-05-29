#!/bin/sh

# Disable beeping.
xset -b

# Turn on Scroll/Num locks.
xset led named Scroll\ Lock
numlockx

# Launch i3.
exec i3
