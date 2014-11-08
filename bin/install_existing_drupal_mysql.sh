#!/bin/bash

SELF_DIRNAME="`dirname -- "$0"`"
PARENT_PATH="`cd -P -- "$SELF_DIRNAME/.." && pwd -P`"
DRUPAL_ROOT="$PARENT_PATH/html"

#
# This script assumes that you have customized this
# project and moved it into your own Drupal project,
# following the instructions in the README file.
# You may need to edit the paths given here if
# your layout is different than what was used in the example.
#
# Build an instance of Drupal using mysql.
# This assumes that you have a mysql user
# 'root' with no password.  Travis sets
# up one of these for you by default.
#
cd "$DRUPAL_ROOT"
drush si -y standard --db-url=mysql://root@localhost/drupal --account-name=admin --account-pass=admin
