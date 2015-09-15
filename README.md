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


Basic Puppet Installation
-------------------------

This package can be installed on a stock Raspbian distribution as follows.  Note
that the final image can be sized to a 4Gb card for distribution, but the
intervening size may be larger unless performed incrementally, with apt-get
clean used to remove downloaded packages in stages.  An 8Gb card is recommended.

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
    $ sudo apt-get upgrade
    $ sudo apt-get install puppet

Clone this package from github into a new folder.  For a Raspberry Pi B+, use
the default master branch:

    $ cd /etc/puppet/modules
    $ sudo git clone https://github.com/cmuphyscomp/pi_puppet

For the Raspberry Pi 2, use the raspi2 development branch:

    $ cd /etc/puppet/modules
    $ sudo git clone --branch raspi2  https://github.com/cmuphyscomp/pi_puppet

Run the update script once in-place for initial configuration:

    $ sudo python /etc/puppet/modules/pi_puppet/files/bin/pi_update

After the initial configuration, full updates can be performed as follows:

    $ sudo pi_update

The pi_update script has additional options to run partial updates; to see all options, run:

    $ pi_update --help


Full Courseware Installation
----------------------------

There are many packages for the Pi which need to be installed directly from
sources, so there are other components which are distributed for the course as
packages within /opt.  These are normally given to students as part of a full
Raspbian filesystem image.  The configuration and installation of these packages
may eventually move to pi_puppet, but for now these are maintained partly by
hand.

Three rather hairy and fragile scripts are installed by the pi_puppet package in
/usr/local/bin to assist in rebuilding these trees from scratch.  These are
likely to need adjustment, because they are rarely run and depend on many
outside resources which may have changed in the interim:

    setup_cmuphyscomp
    setup_openframeworks  (not currently supported for RPi2)
    setup_puredata        (not currently supported for RPi2)

These will likely only run on an 8Gb or larger filesystem.
