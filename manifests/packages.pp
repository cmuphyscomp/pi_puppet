
class pi_puppet::packages {

  $course_packages =
  [
   # Provide many general utilities.
   "emacs",
   "gcc",
   "git",
   "git-gui",
   "imagemagick",
   "libtool",
   "make",
   "mlocate",
   "puppet",
   "puppet-el",
   "subversion",
   "unison",
   "sox",
   "wiringpi",

   # "minicom", already in pkgconfig.pp
   # "arduino",     # hopelessly out of date

   # ---------------------------
   # Provide networking and user session support tools.
   "avahi-daemon",
   "dnsutils",
   "netatalk",
   "nmap",
   "ntpdate",
   "screen",
   "sshfs",
   "tightvncserver",
   "x11vnc",
   "xrdp",
   "xterm",
   # "samba", already in pkgconfig.pp

   # ---------------------------
   # Provide a fully-featured Python system.  Note that many of these packages
   # will pull system libraries in implicitly as dependencies, so there are many
   # useful packages which don't need to be explicitly listed.
   "python-opencv",
   "python-pyode",
   "python-scipy",
   "python-setuptools",
   "python-sklearn",
   "python-txosc",
   "python-qwt5-qt4",
   "python-qt4-gl",
   "python-opengl",
   "python-protobuf",
   "python-sphinx",
   # "python-pip",  # hopelessly out of date

   # ---------------------------
   # we are shifting to using a directly compiled Pure Data installation since Debian is quite out of date
   # "puredata",
   # "pd-comport",
   # "pd-zexy",
   # "pd-cyclone",
   # "pd-list-abs",
   # "pd-osc",

   # ---------------------------
   # openFrameworks is provided as an automated build script that runs the
   # normal openFrameworks bootstrapping process.  The normal route includes installing
   # a number of dependencies, so they do not need to be installed via puppet.

   # The dependency scripts get installed in the following locations:
   # Raspberry Pi B+:  /opt/cmuphyscomp/src/openFrameworks/scripts/linux/debian_armv6l/install_dependencies.sh
   # Raspberry Pi 2 :  /opt/cmuphyscomp/src/openFrameworks/scripts/linux/debian/install_dependencies.sh
   ]

  # ================================================================
  # make sure apt-get update runs once before any package installation
  exec { "apt-update":
    command => "/usr/bin/apt-get update",
  }
  Exec["apt-update"] -> Package <| |>

  # ================================================================
  # make sure all required packages are installed
  package { $course_packages:
    ensure => "installed",
    # ensure => "latest",
  }

  # ================================================================
  # Define packages to remove.
  $remove_packages =
  [

   ]

  #  package { $remove_packages:
  #    ensure => "purged",
  #  }

  # ================================================================
}
