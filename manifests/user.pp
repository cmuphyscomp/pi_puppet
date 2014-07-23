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
    target => '/opt/cmuphyscomp/course-demos/lib/physcomp',
    owner  => pi,
    group  => pi,
  }

  # Pure Data examples provided with the course
  file { "/home/pi/pd-externals/demos":
    ensure => 'link',
    target => '/opt/cmuphyscomp/course-demos/demos',
    owner  => pi,
    group  => pi,
  }

  file { "/home/pi/pd-externals/doc":
    ensure => 'link',
    target => '/opt/cmuphyscomp/course-demos/doc',
    owner  => pi,
    group  => pi,
  }

  ################################################################
  # folders to hold Arduino sketches and libraries
  # file { "/home/pi/Arduino":
  #   ensure => 'directory',
  #   mode   => 0755,
  #   owner  => pi,
  #   group  => pi,
  # }

  # file { "/home/pi/Arduino/libraries":
  #   ensure => 'directory',
  #   mode   => 0755,
  #   owner  => pi,
  #   group  => pi,
  # }

  # # Arduino sketches provided with the course
  # file { "/home/pi/Arduino/cmuphyscomp":
  #   ensure => 'link',
  #   target => '/opt/cmuphyscomp/course-demos/Arduino/',
  #   owner  => pi,
  #   group  => pi,
  # }

  # # Arduino libraries provided with the course
  # file { "/home/pi/Arduino/libraries/OSC":
  #   ensure => 'link',
  #   target => '/opt/cmuphyscomp/src/OSC',
  #   owner  => pi,
  #   group  => pi,
  # }

}
