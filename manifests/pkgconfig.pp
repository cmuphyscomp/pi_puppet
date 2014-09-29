# Configure system-level packages.

class pi_puppet::pkgconfig {

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

  file { "/etc/modprobe.d/raspi-blacklist.conf":
    ensure => present,
    mode   => 0644,
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/pi_puppet/etc/modprobe.d/raspi-blacklist.conf",
  }

  package { 'samba':
    ensure => present,
    before => [ File['/etc/samba/smb.conf'], File['/var/lib/samba/passdb.tdb'] ],
  }

  file { "/etc/samba/smb.conf":
    ensure => present,
    mode   => 0644,
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/pi_puppet/etc/samba/smb.conf",
    }

  # The following samba password database includes an entry for the default 'pi'
  # user created as follows:
  #   sudo pdbedit -a -u pi
  file { "/var/lib/samba/passdb.tdb":
    ensure => present,
    mode   => 0600,
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/pi_puppet/var/lib/samba/passdb.tdb",
  }

  package { 'minicom':
    ensure => present,
    before => File['/etc/minicom/minirc.dfl'],
  }

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
  # this is now created manually by the bootstrap_opt_cmuphyscomp script
  # file { "/opt/cmuphyscomp":
  #   ensure => 'directory',
  #   mode   => 0755,
  #   owner  => root,
  #   group  => root,
  # }

  # locally compiled Pure Data library, kept in the course package
  file { "/usr/local/lib/pd-externals/mrpeach":
    ensure => 'link',
    target => '/opt/cmuphyscomp/lib/pd-externals/mrpeach/',
    owner  => root,
    group  => root,
  }

  # locally compiled Pure Data library, kept in the course package
  file { "/usr/local/lib/pd-externals/moocow":
    ensure => 'link',
    target => '/opt/cmuphyscomp/lib/pd-externals/moocow/',
    owner  => root,
    group  => root,
  }

  # locally compiled Pure Data library, kept in the course package
  file { "/usr/local/lib/pd-externals/pdpython":
    ensure => 'link',
    target => '/opt/cmuphyscomp/lib/pd-externals/pdpython/',
    owner  => root,
    group  => root,
  }

  # locally compiled Pure Data library, kept in the course package
  file { "/usr/local/lib/pd-externals/pdwiringPi":
    ensure => 'link',
    target => '/opt/cmuphyscomp/lib/pd-externals/pdwiringPi/',
    owner  => root,
    group  => root,
  }

}
