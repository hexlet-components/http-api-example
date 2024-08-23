PORT ?= 4010

install:
	npm install

compile:
	npx tsp compile .

mock:
	npx prism mock openapi.yaml -h 0.0.0.0 -p $(PORT)

compose-build:
	docker compose build

compose:
	docker compose up
