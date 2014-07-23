class pi_puppet::network {
  
  # Network configuration for the CMU campus.
  # file { "/etc/resolv.conf":
  #   ensure => present,
  #   mode   => 0644,
  #   owner  => 'root',
  #   group  => 'root',
  #   source => "puppet:///modules/pi_puppet/etc/resolv.conf",
  # }

  # file { "/etc/default/ntpdate":
  #   ensure => present,
  #   mode   => 0644,
  #   owner  => 'root',
  #   group  => 'root',
  #   source => "puppet:///modules/pi_puppet/etc/default/ntpdate",
  # }

  # set up Wifi for CMU
  # file { "/etc/NetworkManager/system-connections/CMU":
  #   mode   => 0600,
  #   owner  => 'root',
  #   group  => 'root',
  #   source => "puppet:///modules/pi_puppet/etc/NetworkManager/system-connections/CMU",
  # }

  # # set up the hardwired ethernet for static local IP
  # file { "/etc/NetworkManager/system-connections/wired-ethernet-eth0":
  #   mode   => 0600,
  #   owner  => 'root',
  #   group  => 'root',
  #   source => "puppet:///modules/pi_puppet/etc/NetworkManager/system-connections/wired-ethernet-eth0",
  # }
}
