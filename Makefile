install:
	npm install

compile:
	tsp compile .

mock:
	npx prism mock openapi.yaml
