#!/bin/bash

cd ~/shell_logs || exit

git add .

git commit -m "Auto log update: $(date '+%F %T')" --allow-empty

git push origin main
