preview:
	jupyter-book build .	
deploy:
	make rebuild
	ghp-import -n -p -f ./_build/html
rebuild:
	jupyter-book build --all .