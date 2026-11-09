.PHONY: lint validate

lint:
	shellcheck scripts/*

validate:
	@test -f .env || cp .env.example .env.ci
	@mkdir -p secrets && test -f secrets/rcon_password || echo ci > secrets/rcon_password
	docker compose --env-file $$(test -f .env && echo .env || echo .env.ci) config --quiet && echo "compose file valid"
	@rm -f .env.ci
