class pi_puppet::user {

  # Default 'pi' user account configuration.

  # Make sure some additional folders exist in the standard user home folder.

  # file { "/home/pi/bin":
  #   ensure => 'directory',
  #   mode   => 0755,
  #   owner  => pi,
  #   group  => pi,
  # }

  # file { "/home/pi/etc":
  #     ensure => 'directory',
  #        mode   => 0755,
  #     owner  => pi,
  #     group  => pi,
  # }

  # this normally already exists
  file { "/home/pi/Desktop":
    ensure => 'directory',
    mode   => 0755,
    owner  => pi,
    group  => pi,
  }

  # folder to hold ssh keys
  file { "/home/pi/.ssh":
    ensure => 'directory',
    mode   => 0700,
    owner  => pi,
    group  => pi,
  }

  ################################################################
  # top-level link to course content
  file { "/home/pi/physcomp-examples":
    ensure => 'link',
    target => '/opt/cmuphyscomp/physcomp-examples',
    owner  => pi,
    group  => pi,
  }

  
  # folder to hold Pure Data patches and externals
  file { "/home/pi/pd-externals":
    ensure => 'directory',
    mode   => 0755,
    owner  => pi,
    group  => pi,
  }

  # Pure Data library provided with the course
  file { "/home/pi/pd-externals/physcomp":
    ensure => 'link',
    target => '/opt/cmuphyscomp/physcomp-examples/support/Pd-library/physcomp',
    owner  => pi,
    group  => pi,
  }

  # Pure Data examples provided with the course
  # this are likely moot
  file { "/home/pi/pd-externals/demos":
    ensure => 'link',
    target => '/opt/cmuphyscomp/physcomp-examples/support/Pd-demos',
    owner  => pi,
    group  => pi,
  }

  # Pure Data reference documentation provided with the course
  file { "/home/pi/pd-externals/reference":
    ensure => 'link',
    target => '/opt/cmuphyscomp/physcomp-examples/reference',
    owner  => pi,
    group  => pi,
  }

  ################################################################
  # Setup for the default Raspbian 1.0.1 Arduino IDE (which doesn't support the Due).

  # # folders to hold Arduino sketches and libraries
  # file { "/home/pi/sketchbook":
  #   ensure => 'directory',
  #   mode   => 0755,
  #   owner  => pi,
  #   group  => pi,
  # }

  # file { "/home/pi/sketchbook/libraries":
  #   ensure => 'directory',
  #   mode   => 0755,
  #   owner  => pi,
  #   group  => pi,
  # }

  # # Arduino sketches provided with the course
  # file { "/home/pi/sketchbook/cmuphyscomp":
  #   ensure => 'link',
  #   target => '/opt/cmuphyscomp/physcomp-examples/support/Arduino/',
  #   owner  => pi,
  #   group  => pi,
  # }

  # # Arduino libraries provided with the course
  # file { "/home/pi/sketchbook/libraries/OSC":
  #   ensure => 'link',
  #   target => '/opt/cmuphyscomp/src/OSC',
  #   owner  => pi,
  #   group  => pi,
  # }
  
  ################################################################
  # Running pd or other graphical applications as root using sudo won't work
  # using X11 over ssh unless root is provided with X11 credentials.  This
  # creates a symbolic link so that root shares the same credentials as the
  # default 'pi' user.
  
  file { "/root/.Xauthority":
    ensure => 'link',
    target => '/home/pi/.Xauthority',
    owner  => root,
    group  => root,
  }

}
