#!/bin/bash

DB_FILE=/srv/reviews.local/data/reviewboard

if [ ! -f $DB_FILE ] || [ ! -s $DB_FILE ]
then
    cp /srv/reviews.local/reviewboard /srv/reviews.local/data/
fi

if [ -n "$LDAP_HOST" ] && [ -n "$LDAP_PORT" ] && [ -n "$LDAP_BASE_DN" ]
then
    echo "-> LDAP setting"
    echo "LDAP HOST: $LDAP_HOST"
    echo "LDAP PORT: $LDAP_PORT"
    echo "LDAP BASE DN: $LDAP_BASE_DN"
    rb-site manage /srv/reviews.local set-siteconfig -- --key=auth_ldap_uri --value=ldap://"$LDAP_HOST":"$LDAP_PORT"
    rb-site manage /srv/reviews.local set-siteconfig -- --key=auth_ldap_base_dn --value="$LDAP_BASE_DN"
    rb-site manage /srv/reviews.local set-siteconfig -- --key=auth_backend --value=ldap
else
    echo "Skipped LDAP setting"
fi

/usr/local/sbin/run_supervisord