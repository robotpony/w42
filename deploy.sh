#!/bin/zsh

hugo list drafts | ../../hugo-auto-drafts-and-future-posts/hd2html.py  --markdown --title "Draft posts" > content/pages/current-drafts.md
hugo list future | ../../hugo-auto-drafts-and-future-posts/hd2html.py  --markdown --title "Future posts" > content/pages/future-posts.md

hugo && rsync -avz --delete --exclude .gitignore --exclude .DS_Store --exclude .git/ --exclude deploy.sh public/ w28@w42.warpedvisions.org:~/warpedvisions.org/

