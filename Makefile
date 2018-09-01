build:
	docker-compose build

rebuild:
	# docker-compose stop && docker-compose rm -f && docker rmi $(docker images -q cambooth:latest) && docker-compose build
	docker-compose stop && docker-compose rm -f && docker images -q cambooth:latest | xargs --no-run-if-empty docker rmi && docker-compose build

up:
	docker-compose up -d

up-no-daemon:
	docker-compose up

start:
	docker-compose start

stop:
	docker-compose stop

restart:
	docker-compose stop && docker-compose start

shell-nginx:
	docker exec -ti proxy_nginx bash

shell-web:
	docker exec -ti web_django bash

shell-db:
	docker exec -ti db_postgres bash
	# psql -h db -d cam_db -U camuser --password

shell-psql:
	docker exec -ti db_postgres psql -h db -d cam_db -U camuser --password

log-nginx:
	docker-compose logs nginx  

log-web:
	docker-compose logs web  

log-db:
	docker-compose logs db

collectstatic:
	docker exec web_django /bin/sh -c "cd code; python manage.py collectstatic --noinput;"