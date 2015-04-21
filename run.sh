#!/bin/bash

DB_FILE=/srv/reviews.local/data/reviewboard

if [ ! -f $DB_FILE ] || [ ! -s $DB_FILE ]
then
    cp /srv/reviews.local/reviewboard /srv/reviews.local/data/
fi

/usr/local/sbin/run_supervisord
