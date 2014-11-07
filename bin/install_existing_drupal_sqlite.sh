#!/bin/bash

SELF_DIRNAME="`dirname -- "$0"`"
PARENT_PATH="`cd -P -- "$SELF_DIRNAME/.." && pwd -P`"
DRUPAL_ROOT="`cd -P -- "$PARENT_PATH/../drupal" && pwd -P`"

#
#
#
# Build a instance of Drupal using sqlite.
# This requires that you have sqlite already installed.
#
# If you want to run on mysql, or set up for non-local use,
# use the install_drupal.sh script instead.
#
drush -y -v core-quick-drupal --root="$DRUPAL_ROOT" --use-existing --browser=0 --no-server --account-name=admin --account-pass=admin
