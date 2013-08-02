class base::repoforge {
  class { '::repoforge': 
    before => Class['base::packages'],
  }
}
