class base::packages {
  case $operatingsystem {
    centos, redhat: {
      include repoforge
      singleton_packages( 'wget', 'vim-enhanced', 'htop' )
    }
    debian, ubuntu: {
      singleton_packages( 'curl', 'vim', 'htop', 'iftop' )
    }
    default: {
      fail("Unrecognized operating system")
    }
  }
  # Common packages
  singleton_packages( 'sudo', 'screen', 'zsh', 'mc')
}
