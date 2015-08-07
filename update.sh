#!/bin/sh
cd /home/pi/smartmeter_release
git fetch origin
UPDATE=$(git log HEAD..origin/master --oneline)

if [ "$UPDATE" != "" ]
then
    echo 'new update found, pulling from master...'
    git pull origin master
    sudo reboot
else
    echo "no new update available"
fi
