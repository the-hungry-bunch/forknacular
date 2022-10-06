setup:
	docker-compose build

terminal:
	docker-compose run --rm development sh

development:
	docker-compose up development
