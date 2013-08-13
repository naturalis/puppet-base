# Optional configuration class
class base::config {
  
   
  group { 'wheel': ensure => present, }

  download { "/etc/screenrc":
    uri	    => 'http://git.grml.org/f/grml-etc-core/etc/grml/screenrc_generic',
    timeout => 900,
  }
  
  download { "/etc/vimrc":
    uri	    => 'http://git.grml.org/f/grml-etc-core/etc/vim/vimrc',
    timeout => 900,
  }
  
  download { "/etc/zshrc":
    uri     => 'http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc',
    timeout => 900,
  }

}
