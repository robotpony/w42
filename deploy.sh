#!/bin/zsh

hugo && rsync -avz --delete public/ w28@w42.warpedvisions.org:~/warpedvisions.org/
