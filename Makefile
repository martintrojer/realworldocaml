.PHONY:	connect

connect:
	docker run --rm -v $(shell pwd):/home/martin/ocaml -i -t devbox-ocaml /bin/bash

build:
	docker build --rm -t devbox-ocaml .
