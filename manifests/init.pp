# == Class: base
#

class base (
  $users_hash              = 'hiera_based',   # hiera variable = baseusers
  $application_users_hash  = 'hiera_based',   # hiera variable = applicationusers
) {

  include stdlib
  class { 'base::packages': } -> class { 'base::config': }
  
  # create base users from hiera or from hash. 
  if $users_hash == 'hiera_based' {
    create_resources('base::users', hiera('baseusers',{}))
  }
  elsif $users_hash == 'none' {
    notify {'no users created':}
  }
  else {
    create_resources('base::users', parseyaml($users_hash))
  }

  # create application users
  if $application_users_hash == 'hiera_based' {
    create_resources('base::users', hiera('applicationusers',{}))
  }
  elsif $application_users_hash == 'none' {
    notify {'no users created':}
  }
  else {
    create_resources('base::users', parseyaml($application_users_hash))
  }


}
