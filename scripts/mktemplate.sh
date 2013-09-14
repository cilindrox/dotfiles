#!/bin/bash

PROJECT_ROOT=$1

# Switch to the given project folder and initialize a git repo
cd $PROJECT_ROOT && git init

# TODO:
# touch .gitkeep

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
touch $README_FILE
touch $APP_FILE

# Nothing to do here...
exit 0
