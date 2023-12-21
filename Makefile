PROJECT_DIR = srcs

# Export .env its lines as environment variables
# Note that this breaks if the $ characters in .env haven't been replaced with $$
# See https://unix.stackexchange.com/a/348432
include $(PROJECT_DIR)/.env
export $(shell sed 's/=.*//' $(PROJECT_DIR)/.env)

# --project-directory tells docker which directory docker-compose.yml is in
#       and is better than -f since docker-compose.yml uses relative paths
# --build rebuilds images before starting the containers
# --detach runs the containers in the background
# --remove-orphans removes containers for services not defined in the Compose file
.PHONY: up
up:
	mkdir -p $(MARIADB_VOLUME) $(WORDPRESS_VOLUME)
	docker compose --project-directory $(PROJECT_DIR) up --build --detach --remove-orphans

.PHONY: down
down:
	docker compose --project-directory $(PROJECT_DIR) down

# `--insecure` is necessary to circumvent curl's self-signed certificate error
.PHONE: connect
connect:
	curl --insecure https://localhost

# $$ is an escaped $, and it gives sh, rather than Make, the chance to expand it
# 2> /dev/null ignores errors when $$(docker ps -qa) expands to an empty result
# Likewise, || exit 0 makes sure Make doesn't report an error
.PHONY: clean
clean:
	docker stop $$(docker ps -qa) 2> /dev/null || exit 0
	docker rm $$(docker ps -qa) 2> /dev/null || exit 0
	docker rmi -f $$(docker images -qa) 2> /dev/null || exit 0
	docker volume rm $$(docker volume ls -q) 2> /dev/null || exit 0
	docker network rm $$(docker network ls -q) 2> /dev/null || exit 0
	docker builder prune -f
	sudo rm -rf $(VOLUME_DIR)
