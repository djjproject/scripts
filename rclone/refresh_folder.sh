#!/bin/sh

# refresh music folder
cd /srv/rclone/100.djjproject/music
rename 's/^/_/' *
rename 's/_//' *
