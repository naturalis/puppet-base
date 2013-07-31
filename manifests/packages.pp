class base::packages {
  case $operatingsystem {
    centos, redhat: {
      include repoforge
#      singleton_packages( 'sudo', 'screen', 'zsh', 'mc', 'wget', 'vim-enhanced', 'htop' )
    }
    debian, ubuntu: {
      singleton_packages( 'sudo', 'screen', 'zsh', 'mc', 'curl', 'vim', 'htop', 'iftop' )
    }
    default: {
      fail("Unrecognized operating system")
    }
  }
}
