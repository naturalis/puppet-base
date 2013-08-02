class base::packages {
  case $operatingsystem {
    centos, redhat: {
      include repoforge
      Class['base::packages'] -> Class['repoforge']
      singleton_resources(
        Package['sudo'],
        Package['screen'],
        Package['zsh'],
        Package['mc'],
        Package['wget'],
        Package['vim-enhanced'],
        Package['htop'],
      )
    }
    debian, ubuntu: {
      singleton_resources(
        Package['sudo'],
        Package['screen'],
        Package['zsh'],
        Package['mc'],
        Package['curl'],
        Package['vim'],
        Package['htop'],
        Package['iftop'],
      )
    }
    default: {
      fail("Unrecognized operating system")
    }
  }
}
