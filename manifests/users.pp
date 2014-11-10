# == Class: base::users
#
#Installs users and ssh keys from hiera.
#
#
define  base::users(
  $comment,
  $username = $title,
  $ssh_key = '',
  $shell = '/bin/zsh',
  $groups = 'wheel',

) {


  user { $username :
    ensure      => present,
    groups      => $groups,
    shell       => $shell,
    comment     => $comment,
  }

  group { $username :
    ensure => present,
  }

  file { "/home/${username}":
    ensure  => directory,
    owner   => $username,
    group   => $username,
    mode    => '0700',
  }

  file { "/home/${username}/.vimrc":
    ensure  => 'link',
    target  => '/etc/vimrc',
  }

  file { "/home/${username}/.screenrc":
    ensure  => 'link',
    target  => '/etc/screenrc',
  }

  file { "/home/${username}/.zshrc":
    ensure  => 'link',
    target  => '/etc/zshrc',
  }

  file { "/home/${username}/.ssh":
    ensure  => directory,
    owner   => $username,
    group   => $username,
    mode    => '0600',
  }

  file { "/home/${username}/.config":
    ensure  => directory,
    owner   => $username,
    group   => $username,
    mode    => '0600',
  }

  file { "/home/${username}/.config/mc":
    ensure  => directory,
    owner   => $username,
    group   => $username,
    mode    => '0600',
  }

  file { "/home/${username}/.config/mc/ini":
    source  => "puppet:///modules/base/mc_ini",
    ensure  => "present",
    replace => "no",
    owner   => $username,
    group   => $username,
    mode    => '0600',
  }

  file { "/home/${username}/.ssh/authorized_keys":
    ensure  => present,
    owner   => $username,
    group   => $username,
    mode    => '0600',
    require => File["/home/${username}/.ssh"],
    }

  Ssh_authorized_key {
    require =>  File["/home/${username}/.ssh/authorized_keys"]
  }

  $ssh_key_defaults = {
    ensure  => present,
    user    => $username,
    type    => 'ssh-rsa'
  }

  if $ssh_key {
    ssh_authorized_key { $ssh_key['comment']:
      ensure  => present,
      user    => $username,
      type    => $ssh_key['type'],
      key     => $ssh_key['key'],
    }
  }
}
