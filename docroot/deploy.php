<?php
	/**
	 * GIT DEPLOYMENT SCRIPT
	 *
	 * Automatic deployment script, based on https://gist.github.com/1809044
	 */

	// The command to run
        $logfile = 'deploy.log';
	$commands = array(
		'/var/www/docroot/drupal-deploy.sh > deploy.log 2>&1'
	);

	// Run the commands for output
	foreach($commands AS $command){
		// Run it
		shell_exec($command);
	}
        if (file_exists($logfile)) { 
         readfile($logfile);
        }
?>
