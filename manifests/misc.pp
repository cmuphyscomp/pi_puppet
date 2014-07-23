class pi_puppet::misc {
  
  file { "/etc/motd":
    ensure => present,
    mode   => 0644,
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/pi_puppet/etc/motd",
  }

  file { "/etc/default/locale":
    ensure => present,
    mode   => 0644,
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/pi_puppet/etc/default/locale",
  }

  # file { "/etc/samba/smb.conf":
  #   ensure => present,
  #   mode   => 0644,
  #   owner  => 'root',
  #   group  => 'root',
  #   source => "puppet:///modules/pi_puppet/etc/samba/smb.conf",
  # }

  # file { "/var/lib/samba/passdb.tdb":
  #   ensure => present,
  #   mode   => 0600,
  #   owner  => 'root',
  #   group  => 'root',
  #   source => "puppet:///modules/pi_puppet/var/lib/samba/passdb.tdb",
  # }

  file { "/etc/minicom/minirc.dfl":
    ensure => present,
    mode   => 0644,
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/pi_puppet/etc/minicom/minirc.dfl",
  }

  # global folder to hold locally installed Pure Data patches and externals
  file { "/usr/local/lib/pd-externals":
    ensure => 'directory',
    mode   => 0755,
    owner  => root,
    group  => root,
  }

  # global folder to hold course package materials in one place
  file { "/opt/cmuphyscomp":
    ensure => 'directory',
    mode   => 0755,
    owner  => root,
    group  => root,
  }

  # locally compiled Pure Data library, kept in the course package
  file { "/usr/local/lib/pd-externals/mrpeach":
    ensure => 'link',
    target => '/opt/cmuphyscomp/lib/pd-externals/mrpeach/',
    owner  => root,
    group  => root,
  }

}
