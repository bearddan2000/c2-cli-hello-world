#! /bin/sh

FILE=hello && \
    c2c -c -f $FILE.c2 1>&2 && \
    output/dummy/dummy && \
    rm -rf output