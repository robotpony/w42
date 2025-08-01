#!/bin/zsh

hugo && rsync -avz --delete --exclude .gitignore --exclude .DS_Store --exclude .git/ --exclude deploy.sh public/ w28@w42.warpedvisions.org:~/warpedvisions.org/
