#!/bin/bash

if [ "$1" = "start" ] ; then
    chown -R mongodb:mongodb /data
    gosu mongodb mongod --fork --logpath /data/mongo.log

    if [ -x /mongodb-init-db.sh ] ; then
        /mongodb-init-db.sh
        chmod -x /mongodb-init-db.sh
    fi

    exec tail -f /dev/null
fi

exec "$@"
