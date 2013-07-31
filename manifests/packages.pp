class base::packages {
  case $operatingsystem {
    centos, redhat: {
      singleton_packages( 'wget', 'vim-enhanced' )
    }
    debian, ubuntu: {
      singleton_packages( 'curl', 'vim', 'htop', �ftop' )
    }
    default: {
      fail("Unrecognized operating system")
    }
  }
  # Common packages
  singleton_packages( 'sudo', 'screen', 'zsh', 'mc')
}
