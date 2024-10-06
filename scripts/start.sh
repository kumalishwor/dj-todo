docker-compose exec app python manage.py collectstatic --noinput

docker-compose exec app python manage.py migrate