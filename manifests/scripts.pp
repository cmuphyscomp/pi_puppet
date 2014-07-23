class pi_puppet::scripts {

  # Make sure some standard scripts are installed.

  file { "/usr/local/bin/pi_update":
    ensure => present,
    mode   => 0755,
    owner  => root,
    group  => root,
    source => "puppet:///modules/pi_puppet/bin/pi_update",
  }

}
