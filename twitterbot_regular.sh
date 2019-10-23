#!/bin/bash

n=0
echo Starting tweetbot monitor ...
while sleep 60; do
  scrot -q 90 /home/minion/bin/twitterImgBot/latest_screenshot/latest.jpg
  if (($n % 60)); then
    # normal
    echo Screenshot update $n at $(date "+%Y-%m-%d %H:%M:%S")
    python3 twitterbot.py
  else
    # every hour
    echo Attempting tweet at loop $n at $(date "+%Y-%m-%d %H:%M:%S")
    python3 twitterbot.py --tweet
  fi
  ((n++))
done
