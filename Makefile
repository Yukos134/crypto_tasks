# Makefile
# make - собрать все проекты в папке в dev окружении
# make fast - собрать параллельно все проекты в папке в dev окружении
# make clean - остановить и удалить все контейнеры, очистить БД

docker_compose_file:=-f docker-compose.yml

ifeq (build,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "build"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

build:
	docker-compose $(docker_compose_file) up -d --build $(RUN_ARGS)

fast:
	docker-compose $(docker_compose_file) build --parallel
	docker-compose $(docker_compose_file) up -d

test:
	docker-compose exec backend python manage.py test

status:
	docker-compose ps

stop:
	docker-compose stop

logs:
	docker-compose logs -f

clean:
	docker-compose down
	docker-compose down --remove-orphans
	docker-compose down -v

