#!/bin/bash

if [ "$1" = "start" ] ; then
    cp -r dist/* /data

    exec echo "This container does not run in foreground mode!"
fi

exec "$@"
