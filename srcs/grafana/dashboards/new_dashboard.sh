#!/bin/sh


PORT="$3"
NAME="$2"
FILE="$1"

OLD_NAME="wordpress"
OLD_PORT="5050"
NEW_FILE="$NAME.json"
cp $FILE $NEW_FILE
sed -i "s/$OLD_NAME/$NAME/g" $NEW_FILE
sed -i "s/$OLD_PORT/$PORT/g" $NEW_FILE
