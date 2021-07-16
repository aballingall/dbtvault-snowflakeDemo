#!make

.ONESHELL:

venv:
	python3 -m venv .venv
	make activate && make reqs
	make deps

activate:
	. .venv/bin/activate

install-githooks:
	pre-commit install

reqs:
	pip3 install -r requirements.txt --user

lint:
	pylint *.py

deps:
	dbt deps

#dbt shortcuts

run:
	dbt --warn-error run

full-refresh:
	dbt --warn-error run --full-refresh

raw:
	dbt run --model tag:raw

stage:
	dbt run --model tag:stage

hubs:
	dbt run --model tag:hub

links:
	dbt run --model tag:link

sats:
	dbt run --model tag:satellite

t_links:
	dbt run -m tag:t_link


# Example: Run all models tagged "daily", except those that are tagged hourly
# See 
run-daily: 
	dbt run --model tag:daily --exclude tag:hourly

.PHONY: activate venv reqs test