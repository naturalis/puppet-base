# == Class: base
#

class base (
  $users_hash = 'hiera_based',
) {

  include stdlib
  class { 'base::packages': } -> class { 'base::config': }
  
  if $users_hash == 'hiera_based' {
    create_resources('base::users', hiera('baseusers',{}))
  }
  elsif $users_hash == 'none' {
    notify {'no users created':}
  }
  else {
    create_resources('base::users', parseyaml($users_hash))
  }

}
