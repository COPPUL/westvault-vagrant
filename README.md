# WestVault Vagrant

A test/development environment for COPPUL's WestVault digital preservation storage service.

## Prerequisites

Install the following prerequisites on your laptop or desktop:

1. [VirtualBox](https://www.virtualbox.org/)
2. [Vagrant](http://www.vagrantup.com/)

## Setting up your virtual machine

1. `git clone https://github.com/mjordan/pkppln_vagrant`
2. `cd pkppln_vagrant`
3. `vagrant up`

There is quite a bit of manual setup involved in getting all the pieces - OwnCloud, the staging server, LOCKSS-O-Matic, and the LOCKSS daemon test network - communicating and working together. We're working on reducing the number of manual steps!

## Setting up LOCKSSOMatic

* Log in at http://localhost:8181/lockssomatic (admin@example.com / admin)
* Create a content owner from the LOCKSS menu.
* Build a new PLN (network) in the LOCKSS Networks menu item.
  * You will need to provide a username and password that LOCKSSOMatic can use to interact with LOCKSS. Accounts using these credentials will be created in the LOCKSS daemons. Note: do not use an email address as the username.
  * The WestVault LOCKSS Plugin should already be loaded. Check that it is in the LOCKSS -> Plugins menu item. If it isn't, do the following:
    * Log into the virtual machine by running "vagrant ssh" in your vagrant directory.
    * Change to the directory where LOCKSS-O-Matic is installed: "cd /var/www/lockssomatic".
    * Import the WestVault LOCKSS plugin: "./app/console lom:import:plugin /vagrant/lockss/WestVaultPlugin.jar".
* Create a new Content Provider in the LOCKSS menu. Use this information:
  * UUID: 1AAB46A6-DA24-410A-9344-CBD9C1991B70
  * Permission URL: http://localhost:8181/westvaultpln/web/app_dev.php/permission
  * Name: WestVault
  * Max File Size: 1000000 (that's about 100 Mb.)
  * Max AU Size: 1000000 (that's about 100 Mb.)
  * Content Owner: select the one created above.
  * Plugin: COPPUL WestVault PLN Plugin Version 3
  * PLN: select the one created above
* Save the Content Provider.
* Visit the PLN details page from the Networks menu -> Your network name.
* Add the four boxes for the LOCKSS test framework from the Networks -> Your Network Name -> Boxes menu.
* Add the first box using this information:
  * Hostname: localhost
  * Active: Yes
  * Protocol: TCP
  * IP Address: 127.0.0.1
  * LOCKSS Port: 9721
  * LOCKSS UI Port: 8081
  * PLN: select the one created above.
  * Add three more using the same info as the first one (using the Networks -> Your Network Name -> Boxes menu) with these port numbers:

LOCKSS ports | LOCKSS UI ports
--- | ---
9722 | 8082
9723 | 8083
9724 | 8084

* Visit the PLN details page from the Networks menu -> Your network name
* Upload the public keystore by clicking on the Keystore button. Upload the file [vagrant directory]/lockss/mjoyce.keystore from the vagrant repository.
* Visit the PLN details page from the Networks menu -> Your network name
* Add the LOCKSS configuration parameters necessary for making all this work by clicking on the "Details" button under All Properties. Add these properties by entering the names and values and clicking on "Create":

Name | Value
--- | ---
org.lockss.subscription.enabled | true
org.lockss.ui.contactEmail | westvault@example.com
org.lockss.ui.access.ip.include | value 0: 192.168.100.0.24, value 1: 10.0.0.0/8
org.lockss.subscription.totalSubscriptionEnabled | true


Finished configuring LOCKSS-O-Matic! Good time for ice cream.

## Setting up OwnCloud

* Sign into OwnCloud at http://localhost:8181/owncloud (mark / mark)
* Go to the WestVault app in the top left menu.
  * Visit the settings page.
  * Refresh the Terms of Use.
  * Tick the "I agree to abide by the terms of use." checkbox and save agreement.

## Setting up the staging server

* Sign into the staging server at http://localhost:8181/westvaultpln/login (admin@example.com / admin)
* Find yourself in the list of providers and click on your name.
* Copy your UUID.
* Go to the Providers Whitelist page.
* Create a new whitelist entry with your copied UUID.

Now you can send deposits from OwnCloud to the staging server.

* Return to the OwnCloud app Settings page. Scroll to the bottom and click on Save Settings.
* Go to the files page in the top left menu - there should be "lockss-preserved" and "lockss-restored" folders.
* Open the lockss-preserved folder and drag/drop files into it.
* Go back to the WestVault app, and see the files listed. They will have no status information because they haven't been deposited yet.

Log into the virtual machine by running `vagrant ssh`. We're going to run some commands to make all these applications talk to each other!

* Send the deposit notifications to the staging server:
  * `cd /var/www/owncloud`
  * `sudo -u www-data ./occ westvault:deposit` (there will be no output)
  * `sudo -u www-data ./occ westvault:status` (the files you added to OwnCloud should be listed)
* Tell the staging server to process the deposits and send them to Lockssomatic.
  * `cd /var/www/westvaultpln`
  * `./app/console pln:run-all -vv` (you will see a bunch info and notice messages)
* Write the LOCKSSOmatic configuration files
  * `cd /var/www/lockssomatic`
  * `./app/console lom:export:configs` (there will be no output)
* The LOCKSS boxes on the test network should have started automatically. If for some reason you need to start them manually, follow these steps. It takes a little while.
  * `cd /var/www/lockss-daemon`
  * `cd test/framework/run_multiple_daemons`
  * `./doall clean -fg -all`
  * `./start`
* Check the deposit statuses in the staging server.
  * `cd /var/www/westvaultpln`
  * `./app/console pln:status --all -vv` (you should see some "Deposit is inProgress" messages)
* Check the deposit statuses in OwnCloud.
  * `cd /var/www/owncloud`
  * `sudo -u www-data ./occ westvault:status` (there wil be no output)

Return to the OwnCloud WestVault page and see that the deposit statuses are updated. The status for all your deposits should be "depositedByProvider".

Now we get to log into out LOCKSS boxes. Visit the LOCKSS admin pages listed below and log in with credential lockss-u / lockss-p).

* `http://localhost:8081`
* `http://localhost:8082`
* `http://localhost:8083`
* `http://localhost:8084`

Subscribe to the AUs by going to Journal Configuration -> Add Titles To Subscription Management and then tick the checkbox to the right of "WestVault Staging Server (1 T) (1 AU)" (in the Publisher/Publication Overall Subscription column) until it says "Subscribe All" then click the "Add" button.

Wait for a few minutes. The LOCKSS boxes are harvesting your content from the staging server. If you want to see your harvested content, visit the "Daemon Status" page in the LOCKSS admin user interface. You should see "LOCKSSOMatic AU PKP PLN Deposits from OJS Deposit from WestVault part 1" in the list. If you click on this link, you will see the files you deposited in OwnCloud, named like `http://localhost:8181/westvaultpln/fetch/48CA97CA-78E3-4748-8822-1A3B64F273CD/49259DD6-9635-4B89-B707-79A79926BD3C`, at the bottom of the list of AU content.

* Once the content has been harvested, check the deposit statuses in LOCKSSOMatic. At the command line, run:
  * `cd /var/www/lockssomatic`
  * `./app/console lom:deposit:status`
* Check the deposit statuses in the staging server.
  * `cd /var/www/westvaultpln`
  * `./app/console pln:status -vv -r`
* Check the deposit statuses in OwnCloud.
  * `cd /var/www/owncloud`
  * `sudo -u www-data ./occ westvault:status`

Return to the OwnCloud WestVault page and see that the deposit statuses are in Agreement. At this point, your files are ready to restore. Click the Restore button next to one or more deposits that have reached Agreement. They will be added to the restore queue.

* After queueing some deposits, run the restore command in OwnCloud. At the command line, run
  * `cd /var/www/owncloud`
  * `sudo -u www-data ./occ westvault:restore`

This should download the queued deposits from the LOCKSS network via LOCKSSOMatic and the staging server and place them in the lockss-preserved folder. The status on the deposits should change to restore-complete. 
