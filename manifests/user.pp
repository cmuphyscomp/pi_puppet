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
    target => '/opt/cmuphyscomp/physcomp-examples/support/Pd-library/physcomp',
    owner  => pi,
    group  => pi,
  }

  # Pure Data examples provided with the course
  file { "/home/pi/pd-externals/demos":
    ensure => 'link',
    target => '/opt/cmuphyscomp/physcomp-examples/support/Pd-demos',
    owner  => pi,
    group  => pi,
  }

  # Pure Data machine learning library provided with the course
  file { "/home/pi/pd-externals/ml-lib":
    ensure => 'link',
    target => '/opt/cmuphyscomp/lib/ml-lib/Linux/armv6',
    owner  => pi,
    group  => pi,
  }

  file { "/home/pi/pd-externals/reference":
    ensure => 'link',
    target => '/opt/cmuphyscomp/physcomp-examples/reference',
    owner  => pi,
    group  => pi,
  }

  file { "/home/pi/pd-externals/wiringPi_gpio-help.pd":
    ensure => 'link',
    target => '/opt/cmuphyscomp/src/Pd-wiringPi/wiringPi_gpio/wiringPi_gpio-help.pd',
    owner  => pi,
    group  => pi,
  }

  file { "/home/pi/pd-externals/wiringPi_gpio.pd_linux":
    ensure => 'link',
    target => '/opt/cmuphyscomp/src/Pd-wiringPi/wiringPi_gpio/wiringPi_gpio.l_arm',
    owner  => pi,
    group  => pi,
  }

  # link now moot, this can be removed after all systems update
  file { "/home/pi/pd-externals/doc":
    ensure => 'absent',
  }

  ################################################################
  # Setup for the default Raspbian 1.0.1 Arduino IDE (which doesn't support the Due).

  # folders to hold Arduino sketches and libraries
  file { "/home/pi/sketchbook":
    ensure => 'directory',
    mode   => 0755,
    owner  => pi,
    group  => pi,
  }

  file { "/home/pi/sketchbook/libraries":
    ensure => 'directory',
    mode   => 0755,
    owner  => pi,
    group  => pi,
  }

  # Arduino sketches provided with the course
  file { "/home/pi/sketchbook/cmuphyscomp":
    ensure => 'link',
    target => '/opt/cmuphyscomp/physcomp-examples/support/Arduino/',
    owner  => pi,
    group  => pi,
  }

  # Arduino libraries provided with the course
  file { "/home/pi/sketchbook/libraries/OSC":
    ensure => 'link',
    target => '/opt/cmuphyscomp/src/OSC',
    owner  => pi,
    group  => pi,
  }

}
