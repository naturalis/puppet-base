# Optional configuration class
class base::config {


  group { 'wheel': ensure => present, }

  augeas { 'sudowheel':
    context => '/files/etc/sudoers',
    changes => [
      "set spec[user = '%wheel']/user %wheel",
      "set spec[user = '%wheel']/host_group/host ALL",
      "set spec[user = '%wheel']/host_group/command ALL",
      "set spec[user = '%wheel']/host_group/command/runas_user ALL",
      "set spec[user = '%wheel']/host_group/command/tag NOPASSWD",
      ],
  }

  augeas { 'sshdns':
    context => '/files/etc/ssh/sshd_config',
    changes => [
        "set UseDNS 'no'",
      ],
  }

  augeas { 'sshGSSAPIauth':
    context => '/files/etc/ssh/sshd_config',
    changes => [
        "set GSSAPIAuthentication 'no'",
      ],
  }

  file { '/etc/screenrc':
    source => 'puppet:///modules/base/screenrc_generic',
  }

  file { '/etc/vimrc':
    source => 'puppet:///modules/base/vimrc',
  }

  file { '/etc/zshrc':
    source => 'puppet:///modules/base/zshrc',
  }

  file { '/usr/share/mc/syntax/puppet.syntax':
    source  => 'puppet:///modules/base/mc_puppet.syntax',
    require => Package['mc']
  }

  file { '/usr/share/mc/syntax/Syntax':
    source  => 'puppet:///modules/base/mc_Syntax',
    require => Package['mc']
  }

  file { '/root/.config':
    ensure  => directory,
    mode    => '0600'
  }

  file { '/root/.config/mc':
    ensure  => directory,
    mode    => '0600',
    require => File['/root/.config']
  }

  file { '/root/.config/mc/ini':
    source  => 'puppet:///modules/base/mc_ini',
    replace => 'no',
    ensure  => 'present',
    mode    => '0600',
    require => File['/root/.config/mc']
  }

  exec { 'fix puppet3':
    command => '/usr/sbin/apt install --reinstall puppet-common facter',
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    unless  => 'test -f /usr/bin/puppet'
  }

  if $osfamily == 'debian' {
    exec { 'localegen':
      command => '/usr/sbin/locale-gen nl_NL.UTF-8',
      path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
      unless  => '/usr/bin/locale -a | /bin/grep nl_NL.utf8'
    }
  }

  exec {'fix_fqdn':
    command         => "/bin/echo '127.0.0.1   ${hostname}.${domain} ${hostname}' >> /etc/hosts",
    unless          => '/bin/hostname -f'
  }
}
