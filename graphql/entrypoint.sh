#!/bin/bash

if [ "$1" = "start" ] ; then
    exec npm start
fi

exec "$@"
