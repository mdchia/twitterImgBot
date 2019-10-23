#!/bin/bash

echo Starting tweetbot monitor ...
while sleep 60; do
  scrot /path/latest.jpg
  if (($n % 60)); then
    # normal
    echo Screenshot update at $(date "+%Y-%m-%d %H:%M:%S")
    python twitterbot.py
  else
    # every hour
    echo Attempting tweet at $(date "+%Y-%m-%d %H:%M:%S")
    python twitterbot.py --tweet
  fi
  ((n++))
done
