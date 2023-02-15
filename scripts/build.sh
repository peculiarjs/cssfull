#!/bin/bash

SOURCE="src"
OUTPUT="lib"
OUTPUT_DIR="$OUTPUT/"
BUNDLE="$OUTPUT/bundle.css"
TEMP="$OUTPUT/temp.css"

overwrite_file() {
  tee $1 >> /dev/null
}

## output dir
create_output_dir() {
  mkdir -p $OUTPUT_DIR 
}

clear_output_dir() {
  if ! rm -rf "$OUTPUT_DIR"; then
    echo "removing ${OUTPUT_DIR} was not completed"
  fi
}

recreate_output_dir() {
  if [[ -d "$OUTPUT_DIR" ]]; then
    clear_output_dir
  fi

  create_output_dir
}

## bundling
concat() {
  for FILE in $SOURCE/*; do
    if [[ $FILE != *"index.css" ]]; then
      cat $FILE >> $BUNDLE
    fi
  done
}

clear_unused() {
  FILE=$1
  touch $TEMP

  # removes all comments like /* */
  cat $FILE | sed "s/\/\*.*//" | overwrite_file $TEMP
  # removes all empty lines with spaces or without
  grep "\S" $TEMP | overwrite_file $FILE

  rm $TEMP
}

minify() {
  FILE=$1
  touch $TEMP

  # remove \n in EOL
  tr -d "\n" < $FILE > $TEMP
  # remove extra spaces around {
  sed -e "s/ {  /{/g" $TEMP | overwrite_file $TEMP
  # remove extra spaces around :
  sed -e "s/: /:/g" $TEMP | overwrite_file $TEMP

  cat $TEMP | overwrite_file $FILE
  rm $TEMP
}

create_bundle() {
  concat
  clear_unused $BUNDLE
  minify $BUNDLE
}

prepare_modules() {
  cp -r $SOURCE/* $OUTPUT_DIR
  for FILE in $OUTPUT/*; do
    if [[ $FILE != *"index.css" ]]; then
      clear_unused $FILE
      minify $FILE
    fi
  done
}

main() {
  recreate_output_dir
  prepare_modules 
  create_bundle
}

main
