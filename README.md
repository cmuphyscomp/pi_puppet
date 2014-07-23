cmuphyscomp/pi_puppet
=======================

This package contains administration configuration scripts for the Raspberry Pi
microcontroller systems for the Physical Computing Lab in the IDeATe program at
Carnegie Mellon University.

We are using the Raspberry Pi as a Linux platform for the Fall 2014 iteration of
Introduction to Physical Computing, running the Raspbian distribution. The
scripts in this package use the 'puppet' administration system to customize the
stock configuration for use on the Carnegie Mellon campus and with the course
curriculum.

This package is cloned into the following path:
/etc/puppet/modules/pi_puppet

Once installed, this package provides scripts for a student to initiate a
software update.  During the update, this package is updated from github and
puppet is run to apply any required system changes.


References
----------

  * http://www.raspberrypi.org/help/quick-start-guide/
  * http://www.raspberrypi.org/downloads/
  * http://physcomp.org
  * https://github.com/cmuphyscomp/pi_puppet
  * http://www.cmu.edu/ideate/
  * http://puppetlabs.com/puppet/puppet-open-source


Installation
------------

This package can be installed on a stock Raspbian distribution as follows.

First, the network connection on the Raspberry Pi needs to manually configured
to the point where the public internet is accessible.  A convenient option is to
connect the Ethernet port to a laptop with Internet Sharing enabled, since that
way the laptop can also be used as console.

The following assumes that either the network connection or a monitor and
keyboard have been set up to the point where the Raspberry Pi command line is
available. The default Raspbian login is username 'pi', password 'raspberry'.
For hints, the quick start guide listed above may be helpful.

Make sure that puppet is installed:

    $ sudo apt-get update
    $ sudo apt-get install puppet

Clone this package from github into a new folder:

    $ cd /etc/puppet/modules
    $ sudo git clone https://github.com/cmuphyscomp/pi_puppet

Run the update script once in-place for initial configuration:

    $ sudo python /etc/puppet/modules/pi_puppet/files/bin/pi_update

After the initial configuration, full updates can be performed as follows:

    $ sudo pi_update

The pi_update script has additional options to run partial updates; to see all options, run:
   
    $ pi_update --help
