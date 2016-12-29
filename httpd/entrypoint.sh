#!/bin/bash

if [ "$1" = "start" ] ; then
    exec httpd-foreground
fi

exec "$@"
