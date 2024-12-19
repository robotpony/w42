#!/bin/zsh

hugo && rsync -avz --delete public/ w28@w42.warpedvisions.org:~/w42.warpedvisions.org/
