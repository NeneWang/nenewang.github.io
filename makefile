preview:
	jupyter-book build .
deploy:
	ghp-import -n -p -f ./_build/html
rebuild:
	jupyter-book build --all .