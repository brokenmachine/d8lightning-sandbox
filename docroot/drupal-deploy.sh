#!/bin/bash
set -e # We want to fail at each command, to stop execution
cd /var/www
# setting home because composer complains without it
export HOME="/var/www"
printf "Running as "
echo -n `whoami`
printf '\nRUNNING GIT COMMANDS\n'
echo '----------------'
git pull origin master
git status
cd docroot
printf '\nRUNNING DRUSH COMMANDS\n'
echo '----------------------'
# perform any Drupal database udpates
/usr/local/bin/drush updb -y
# import any configuration elements
/usr/local/bin/drush cim -y
# clear the Drupal caches
/usr/local/bin/drush cr