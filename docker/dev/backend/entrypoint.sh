#!/bin/sh

echo "Waiting for db..."

while ! [ -z "${SQL_HOST}"] && [ -z "${SQL_PORT}" ]; do
  sleep 0.1
done

echo "db started"

python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --no-input
python manage.py runserver 0.0.0.0:8000
exec "$@"
