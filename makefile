all: help

help:
	@echo "Available make commands:"
	@echo "  up           - subir ambiente de dev"
	@echo "  dev           - subir ambiente de dev em background"
	@echo "  down          - parar ambiente de dev"
	@echo "  ps            - mostrar containers"
	@echo "  logs          - mostrar logs"
	@echo "  s             - subir sidekiq"
	@echo "  console       - carregar console do rails"
	@echo "  test          - roda todos os testes"
	@echo "  build         - buildar containers"

up:
	docker compose up

dev:
	docker compose up -d

down:
	docker compose down --remove-orphans

ps:
	docker compose ps

logs:
	docker compose logs -f --tail=30

build:
	docker compose build

console:
	docker compose exec web rails console

bash:
	docker compose exec web sh

