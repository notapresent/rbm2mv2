.PHONY: clean-pyc test
IP ?= '127.0.0.1'
PORT ?= 8001

all: serve

serve:
	gunicorn wsgi:app -c gunicorn_settings.py --bind $(IP):$(PORT)

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +

clean-data:
	rm -rf media/*
	rm -rf logs/*

createdb:
	@python -m rbm2m createdb

dropdb:
	@python -m rbm2m dropdb

init:
	@python -m rbm2m dropdb
	@python -m rbm2m createdb
	@python -m rbm2m import_genres
	@python -m rbm2m reset_settings

install-deps:
	sudo apt-get install --no-install-recommends libmysqlclient-dev
