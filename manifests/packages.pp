
class pi_puppet::packages {

  $course_packages =
  [
   "unison",
   "emacs",
   "gcc",
   "make",
   "git",
   "git-gui",
   "subversion",
   "screen",
   "xrdp",
   "minicom",
   "python-scipy",
   "python-opencv",
   "python-pyode",
   "puppet",
   "puppet-el",
   "arduino",
   "puredata",
   "pd-zexy",
   "pd-cyclone",
   "pd-list-abs",
   "pd-osc",
   "ntpdate",
   "samba",
   "python-txosc",
   "python-liblo",
   "liblo-dev",
   "pyliblo-utils"
   ]

  # Define packages to remove.
  $remove_packages =
  [

   ]
  
  package { $course_packages:
    #  ensure => "installed",
    ensure => "latest",
  }

  #  package { $remove_packages:
  #    ensure => "purged",
  #  }

}
