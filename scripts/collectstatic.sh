#!/bin/sh
docker-compose exec app python manage.py collectstatic --noinput
