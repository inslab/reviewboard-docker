#!/bin/bash

# fix database permissions
chown -R www-data:www-data /srv/reviews.local/data
chmod -R 777 /srv/reviews.local/data
rb-site upgrade /srv/reviews.local

# run supervisor
/usr/bin/supervisord -n
