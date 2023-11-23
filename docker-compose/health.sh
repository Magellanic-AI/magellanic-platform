#!/bin/bash
i=0
j=1

until [ $i == 1 ]
do
    i=$(($(docker ps | grep magellanic-metadata | grep healthy | wc -l)))
done

until [ $j == 0 ]
do
    j=$(($(docker ps | grep magellanic-core-initdb | wc -l)))
done

echo "Metadata store is ready to accept connections."