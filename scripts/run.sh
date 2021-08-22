#!/bin/sh

set -e

python manage.py wait_for_db
python manage.py collectstatic --noinput
python manage.py makemigrations
python manage.py migrate
python manage.py materials
python manage.py submaterials

uwsgi --socket :9000 --workers 4 --master --enable-threads --module mainapp.wsgi
