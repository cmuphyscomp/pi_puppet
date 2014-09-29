class pi_puppet::scripts {

  # Make sure some standard scripts are installed.

  file { "/usr/local/bin/pi_update":
    ensure => present,
    mode   => 0755,
    owner  => root,
    group  => root,
    source => "puppet:///modules/pi_puppet/bin/pi_update",
  }

  file { "/usr/local/bin/setup_openframeworks":
    ensure => present,
    mode   => 0755,
    owner  => root,
    group  => root,
    source => "puppet:///modules/pi_puppet/bin/setup_openframeworks",
  }

  file { "/usr/local/bin/setup_cmuphyscomp":
    ensure => present,
    mode   => 0755,
    owner  => root,
    group  => root,
    source => "puppet:///modules/pi_puppet/bin/setup_cmuphyscomp",
  }

  file { "/usr/local/bin/node-RED":
    ensure => present,
    mode   => 0755,
    owner  => root,
    group  => root,
    source => "puppet:///modules/pi_puppet/bin/node-RED",
  }

}
