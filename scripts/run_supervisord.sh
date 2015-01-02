#!/bin/bash

# fix database permissions
chown -R www-data:www-data /srv/reviews.local/data
rb-site upgrade /srv/reviews.local

if [ ! -f /srv/reviews.local/data/reviewboard ]
then
    cp -f /tmp/reviewboard /srv/reviews.local/data/reviewboard
fi

# run supervisor
/usr/bin/supervisord -n
