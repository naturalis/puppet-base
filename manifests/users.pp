# == Class: base::users
#
#Installs users and ssh keys from hiera.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { base::users: }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
define  base::users(
  $comment,
  $username = $title,
  $ssh_key = '',
  $shell = '/bin/zsh',
  $groups = 'wheel',

) {
  user { $username:
    ensure      => present,
    uid         => $uid,
    gid         => $gid,
    groups      => $groups,
    shell       => $shell,
    comment     => $comment,
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
