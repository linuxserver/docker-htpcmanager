#!/bin/bash

if [ ! -d "/app/htpcmanager/.git" ]; then
/sbin/setuser abc git clone https://github.com/Hellowlol/HTPC-Manager.git /app/htpcmanager
else
cd /app/htpcmanager
git pull
fi
