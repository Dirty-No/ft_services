#!/bin/sh

PATTERN_FILE="$1"
REPLACE_FILE="$2"

first()
{
    printf "$1" | tr -d '\n'
}

second()
{
    printf "$2" | tr -d '\n'
}

cat $PATTERN_FILE | while read line ; do
    PATTERN=$(first $line)
    REPLACE=$(second $line)
    sed -i "s/$PATTERN/$REPLACE/g" "$REPLACE_FILE"
done
