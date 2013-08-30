#!/bin/bash

BASE_DIR=/

# DIRECTORIES
CONFIG_DIR=config
HELPERS_DIR=helpers
MODEL_DIR=model
PUBLIC_DIR=public
CSS_DIR=$PUBLIC_DIR/css
IMG_DIR=$PUBLIC_DIR/images
VIEWS_DIR=views

# FILES
CFG_FILE=config.ru
README_FILE=README.md
APP_FILE=app.rb

# TODO: check if mkdir -p is needed
mkdir $CONFIG_DIR
mkdir $HELPERS_DIR
mkdir $MODEL_DIR
mkdir $PUBLIC_DIR
mkdir $CSS_DIR
mkdir $IMG_DIR
mkdir $VIEWS_DIR

touch $CFG_FILE
touch $README_FILE # TODO: check if there's already a readme file (eg: created by GitHub)
touch $APP_FILE

exit 0
