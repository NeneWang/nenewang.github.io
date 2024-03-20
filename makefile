build:
	jupyter-book build .
serve: build
	python tools/serve.py
deploy:
	ghp-import -n -p -f ./_build/html
rebuild:
	jupyter-book build --all .