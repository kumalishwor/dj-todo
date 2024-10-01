#!/bin/sh
docker-compose -f ./compose/docker-compose.yml exec app python manage.py collectstatic --noinput
