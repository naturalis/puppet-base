class base::packages {
  case $operatingsystem {
    centos, redhat: {
      singleton_packages( 'wget' )
    }
    debian, ubuntu: {
      singleton_packages( 'curl' )
    }
    default: {
      fail("Unrecognized operating system")
    }
  }
  # Common packages
  singleton_packages( 'sudo', 'screen', 'htop', 'iftop', 'vim', 'zsh', 'mc')
}
