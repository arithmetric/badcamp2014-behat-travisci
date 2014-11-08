#!/bin/bash

#
# Build an instance of Drupal using mysql.
# This assumes that you have a mysql user
# 'root' with no password.  Travis sets
# up one of these for you by default.
#
rm -rf html
vendor/bin/drush make -y --force-complete drupal.make html
cd html
../vendor/bin/drush si -y standard --db-url=mysql://root@localhost/drupal --account-name=admin --account-pass=admin

# We might do the same thing with drush quick-drupal
# drush -y core-quick-drupal --profile=standard --makefile=drupal.make --db-url=mysql://root@localhost/drupal --core=drupal-7.x behat_demo devel --browser=0 --no-server --root=html --account-name=admin --account-pass=admin
