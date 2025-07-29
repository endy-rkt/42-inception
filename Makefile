SRCS = $(CURDIR)/srcs

DATA = ~/data

SECRETS_SRCS = $(CURDIR)/secrets

COMPOSE_PATH = $(SRCS)/docker-compose.yaml

SECRETS = db_pass db_root_pass ftp_user_pswd wp_admin_pswd wp_user_pswd

all:	run
		@echo "All services are up and ready..."
		@echo "Use 'make stop' to stop services..."

run:	secret
		docker-compose -f $(COMPOSE_PATH) up --build -d

stop:
		docker-compose -f $(COMPOSE_PATH) down

secret:
		@for i in $(SECRETS); do \
			if [ ! -r "$(SECRETS_SRCS)/$$i.txt" ]; then \
				echo "File $$i.txt does not exist or is inaccessible. Creating..."; \
				read -p "Enter $$i value: " value; \
				echo "$$value" > "$$i.txt"; \
			fi; \
		done
		@echo "All secrets are created."

build:
		docker-compose -f ${COMPOSE_PATH} build
		@echo "All images are builded.";

dir:
		@mkdir -p $(DATA)/wordpress $(DATA)/mysql $(DATA)/backup

.PHONY: all run stop secret build dir
