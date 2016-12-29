#!/bin/bash

for db in dumps/* ; do
    if [ -d ${db} ] ; then
        mongorestore --drop --db $(basename ${db}) --dir ${db}
    fi
done
