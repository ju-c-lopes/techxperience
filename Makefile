# Makefile para TechXperience 🚀

# Carrega variáveis e sobe containers para DEV
dev:
	@echo "🔧 Subindo ambiente DEV..."
	@set -a && . ./.env.dev && set +a && docker compose -f docker-compose.dev.yml up -d
	@echo "Aguarde alguns segundos para o ambiente DEV estar totalmente pronto..."
	@echo "Ambiente DEV iniciado em http://ip-do-host:8081 🚀"

# Carrega variáveis e sobe containers para STAGING
staging:
	@echo "🔧 Subindo ambiente STAGING..."
	@set -a && . ./.env.staging && set +a && docker compose -f docker-compose.staging.yml up -d
	@echo "Aguarde alguns segundos para o ambiente STAGING estar totalmente pronto..."
	@echo "Ambiente STAGING iniciado em http://ip-do-host:8082 🚀"

# Carrega variáveis e sobe containers para PROD
prod:
	@echo "🔧 Subindo ambiente PROD..."
	@set -a && . ./.env.prod && set +a && docker compose -f docker-compose.prod.yml up -d
	@echo "Ambiente PROD iniciado em http://ip-do-host:8080 🚀"

# Derruba todos os containers de DEV
down-dev:
	@echo "🛑 Derrubando ambiente DEV..."
	@set -a && . ./.env.dev && set +a && docker compose -f docker-compose.dev.yml down
	@echo "Ambiente DEV finalizado! 🚀"

# Derruba todos os containers de STAGING
down-staging:
	@echo "🛑 Derrubando ambiente STAGING..."
	@set -a && . ./.env.staging && set +a && docker compose -f docker-compose.staging.yml downdocker
	@echo "Ambiente STAGING finalizado! 🚀"

# Derruba todos os containers de PROD
down-prod:
	@echo "🛑 Derrubando ambiente PROD..."
	@set -a && . ./.env.prod && set +a && docker compose -f docker-compose.prod.yml down
	@echo "Ambiente PROD finalizado! 🚀"

# Carrega variáveis e sobe containers para DEV
dev-restart:
	@echo "🔧 Subindo ambiente DEV..."
	@set -a && . ./.env.dev && set +a && docker compose -f docker-compose.dev.yml restart
	@echo "Aguarde alguns segundos para o ambiente DEV estar totalmente pronto..."
	@echo "Ambiente DEV restartado em http://ip-do-host:8081 🚀"

# Carrega variáveis e sobe containers para STAGING
staging-restart:
	@echo "🔧 Subindo ambiente STAGING..."
	@set -a && . ./.env.staging && set +a && docker compose -f docker-compose.staging.yml restart
	@echo "Aguarde alguns segundos para o ambiente STAGING estar totalmente pronto..."
	@echo "Ambiente STAGING restartado em http://ip-do-host:8082 🚀"

# Carrega variáveis e sobe containers para PROD
prod-restart:
	@echo "🔧 Subindo ambiente PROD..."
	@set -a && . ./.env.prod && set +a && docker compose -f docker-compose.prod.yml restart
	@echo "Ambiente PROD restartado em http://ip-do-host:8080 🚀"

# Lista containers Docker em execução
ps:
	@docker ps
