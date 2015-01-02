#!/bin/bash

# fix database permissions
if [ ! -f /srv/reviews.local/data/reviewboard ]
then
    cp -f /root/reviewboard /srv/reviews.local/data/reviewboard
fi

chown -R www-data:www-data /srv/reviews.local/data
rb-site upgrade /srv/reviews.local

# run supervisor
/usr/bin/supervisord -n

