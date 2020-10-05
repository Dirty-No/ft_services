#!/bin/sh

PATTERN_FILE="$1"
REPLACE_FILE"$2"

first()
{
    echo "$1"
}

second()
{
    echo "$2"
}

cat $PATTERN_FILE | while read line ; do
    PATTERN=$(first $line)
    REPLACE=$(second $line)
    sed -i "s/$PATTERN/$REPLACE/g" "$REPLACE_FILE"
done
