SRCS = $(CURDIR)/srcs

DATA = ~/data

SECRETS_SRCS = $(CURDIR)/secrets

COMPOSE_PATH = $(SRCS)/docker-compose.yaml

SERVICES = adminer ftp mariadb nginx php redis rsync

SECRETS = db_pass db_root_pass ftp_user_pswd wp_admin_pswd wp_user_pswd

all:	run
		@echo "All services are up and ready..."
		@echo "Use 'make stop' to stop services..."

run:	build secret
		@if [ ! -d "$(DATA)/mysql" ]; then \
			mkdir -p $(DATA)/mysql; \
		fi;

		@if [ ! -d "$(DATA)/wordpress" ]; then \
			mkdir -p $(DATA)/wordpress; \
		fi;

		@if [ ! -d "$(DATA)/backup" ]; then \
			mkdir -p $(DATA)/backup; \
		fi;
		docker-compose -f ${COMPOSE_PATH} up -d

stop:
		docker-compose -f ${COMPOSE_PATH} down

cert:
		@if [ ! -r "$(SECRETS_SRCS)/secret.key" ] || [ ! -r "$(SECRETS_SRCS)/secret.crt" ]; then \
			openssl req -newkey rsa:2048 -nodes -keyout $(SECRETS_SRCS)/secret.key -x509 -days 365 \
				-out $(SECRETS_SRCS)/secret.crt; \
			echo "SSL successfully created."; \
		fi;
		@cp	$(SECRETS_SRCS)/secret.key $(SRCS)/requirements/nginx/conf
		@cp	$(SECRETS_SRCS)/secret.crt $(SRCS)/requirements/nginx/conf

secret:
		@for i in $(SECRETS); do \
			if [ ! -r "$(SECRETS_SRCS)/$$i.txt" ]; then \
				echo "File $$i.txt does not exist or is inaccessible. Creating..."; \
				read -p "Enter $$i value: " value; \
				echo "$$value" > "$$i.txt"; \
			fi; \
		done
		@echo "All secrets are created."

build:	cert
		@for i in $(SERVICES); do \
			if [ -z "$$(docker images -q $$i:0.1)" ]; then \
				echo "Image $$i:0.1 does not exist. Building..."; \
				docker build -t $$i:0.1 $(SRCS)/requirements/$$i; \
			fi; \
		done;
		@rm $(SECRETS_SRCS)/secret.key $(SECRETS_SRCS)/secret.crt \
			$(SRCS)/requirements/nginx/conf/secret.key $(SRCS)/requirements/nginx/conf/secret.crt;
		@echo "All images are builded.";

.PHONY: all run stop secret build
