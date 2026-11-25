cd /recollwebui
/usr/bin/gunicorn webui-wsgi:application -c /root/.recoll/gunicorn.conf
