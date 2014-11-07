#!/bin/bash

SELF_DIRNAME="`dirname -- "$0"`"
PARENT_PATH="`cd -P -- "$SELF_DIRNAME/.." && pwd -P`/`basename -- "$0"`"

#
#
#
# Build a instance of Drupal using sqlite.
# This requires that you have sqlite already installed.
#
# If you want to run on mysql, or set up for non-local use,
# use the install_drupal.sh script instead.
#
rm -rf html
drush -y -v core-quick-drupal --profile=standard --core=drupal-7.x behat_demo devel --browser=0 --no-server --root=$PARENT_PATH/html --account-name=admin --account-pass=admin
