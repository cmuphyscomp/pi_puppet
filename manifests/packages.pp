
class pi_puppet::packages {

  $course_packages =
  [
   "unison",
   "emacs",
   "gcc",
   "make",
   "mlocate",
   "git",
   "git-gui",
   "subversion",
   "screen",
   "xrdp",
   "x11vnc",
   "xterm",
   # "minicom", already in pkgconfig.pp
   "python-scipy",
   "python-opencv",
   "python-pyode",
   "python-pip",
   "python-setuptools",
   "imagemagick",
   "puppet",
   "puppet-el",
   "arduino",
   # we are shifting to using a directly compiled Pure Data installation since Debian is quite out of date
   # "puredata",
   # "pd-comport",
   # "pd-zexy",
   # "pd-cyclone",
   # "pd-list-abs",
   # "pd-osc",
   "libtool",
   "ntpdate",
   # "samba", already in pkgconfig.pp
   "dnsutils",
   "netatalk",
   "avahi-daemon",
   "tightvncserver",
   "python-txosc",
   "python-liblo",
   "liblo-dev",
   "pyliblo-utils",

   # The following are required for openFrameworks.  For details, see
   # /opt/cmuphyscomp/src/openFrameworks/scripts/linux/debian_armv6l/install_dependencies.sh
   "libmpg123-dev",
   "alsa-base",
   "alsa-tools",
   "alsa-utils",
   "libupnp-dev",
   "automake",
   "cvs",
   "libavcodec-dev",
   "libavformat-dev",
   "libavutil-dev",
   "libswscale-dev",
   "libasound2-dev",
   "libxmu-dev",
   "libxxf86vm-dev",
   "g++",
   "libgl1-mesa-dev",
   "libglu1-mesa-dev",
   "libraw1394-dev",
   "libudev-dev",
   "libdrm-dev",
   "libglew-dev",
   "libopenal-dev",
   "libsndfile-dev",
   "libfreeimage-dev",
   "libcairo2-dev",
   "libgtk2.0-dev",
   "python-lxml",
   "python-argparse",
   "libfreetype6-dev",
   "libassimp-dev",
   "portaudio19-dev",
   "libssl-dev",
   "libpulse-dev",
   "libgstreamer1.0-dev",
   "libgstreamer-plugins-base1.0-dev",
   "gstreamer1.0-pulseaudio",
   "gstreamer1.0-x",
   "gstreamer1.0-plugins-bad",
   "gstreamer1.0-alsa",
   "gstreamer1.0-plugins-base",
   "gstreamer1.0-plugins-good",
   "gstreamer1.0-plugins-ugly",
   # "1.0-omx"
   ]

  # ================================================================
  # Define packages to remove.
  $remove_packages =
  [

   ]
  # ================================================================
  # install optional package repositories if needed
  file { "/etc/apt/sources.list.d/gstreamer.list":
    mode   => 0644,
    owner  => 'root',
    group  => 'root',
    content => 'deb http://vontaene.de/raspbian-updates/ . main',
  }

  # The gstreamer package key can be installed manually as follows:
  #    gpg --recv-keys 0C667A3E ; gpg -a --export 0C667A3E | sudo apt-key add -
  
  # Prior to this the following was used to just disable authentication, a less than ideal solution.
  file { "/etc/apt/apt.conf.d/99auth":
    mode   => 0644,
    owner  => 'root',
    group  => 'root',
    content => 'APT::Get::AllowUnauthenticated no;',
  }

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
    require => [File['/etc/apt/sources.list.d/gstreamer.list'], File['/etc/apt/apt.conf.d/99auth']], 
  }

  #  package { $remove_packages:
  #    ensure => "purged",
  #  }

}
