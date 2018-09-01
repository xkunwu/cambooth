#!/bin/bash

if [ ! -f "$1" ]; then
  echo "Error: environment file not found!"
  exit 1
fi

source $1

cd ${WORKROOT}/code

python manage.py collectstatic --noinput

python manage.py makemigrations && python manage.py migrate

gunicorn ${PROJNAME}.wsgi:application --bind 0.0.0.0:8102