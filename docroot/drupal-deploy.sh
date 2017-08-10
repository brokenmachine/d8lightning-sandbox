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
# perform any required non-dev composer updates (new modules, themes, etc.)
printf '\nRUNNING COMPOSER\n'
echo '----------------'
/usr/bin/composer install --no-interaction --no-dev
# cd into Drupal siteroot so we can run drush commands
cd docroot
printf '\nRUNNING DRUSH COMMANDS\n'
echo '----------------------'
# perform any Drupal database udpates
/usr/local/bin/drush updb -y
# import any configuration elements
/usr/local/bin/drush cim -y
# clear the Drupal caches
/usr/local/bin/drush cr