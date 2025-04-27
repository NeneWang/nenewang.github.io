#!/bin/zsh

export PYDEVD_DISABLE_FILE_VALIDATION=1

# jupyter-book clean .
pip install -r requirements.txt
jupyter-book build .

ghp-import -n -p -f ./_build/html

git add *
git commit -m'Built book'
git push origin master
