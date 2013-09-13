# Install packages for several operating systems
class base::packages {
  case $::operatingsystem {
    centos, redhat: {
      singleton_resources(
        Package['sudo'],
        Package['screen'],
        Package['zsh'],
        Package['mc'],
        Package['wget'],
        Package['vim-enhanced'],
        Package['htop'],
        Package['iftop'],
        Package['augeas'],
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
        Package['augeas'],
      )
    }
    default: {
      fail('Unrecognized operating system')
    }
  }
}
