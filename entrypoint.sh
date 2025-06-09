#!/bin/sh

python manage.py collectstatic --noinput
python manage.py migrate --noinput

hypercorn backend.wsgi:application --bind 0.0.0.0:80