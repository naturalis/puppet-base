# Optional configuration class
class base::config {
  
   
  group { 'wheel': ensure => present, }

  augeas { "sudowheel":
    context => "/files/etc/sudoers",
    changes => [
      "set spec[user = '%wheel']/user %wheel",
      "set spec[user = '%wheel']/host_group/host ALL",
      "set spec[user = '%wheel']/host_group/command ALL",
      "set spec[user = '%wheel']/host_group/command/runas_user ALL",
      "set spec[user = '%wheel']/host_group/command/tag NOPASSWD",
      ],
  }

  augeas { "sshdns":                                                                                                                                                                                                       
    context => "/files/etc/ssh/sshd_config",                                                                                                                                                                               
    changes => [                                                                                                                                                                                                           
        "set UseDNS 'no'",                                                                                                                                                                                                 
      ],                                                                                                                                                                                                                   
  }                                                                                                                                                                                                                        

  augeas { "sshGSSAPIauth":                                                                                                                                                                                                       
    context => "/files/etc/ssh/sshd_config",                                                                                                                                                                               
    changes => [                                                                                                                                                                                                           
        "set GSSAPIAuthentication 'no'",                                                                                                                                                                                                 
      ],                                                                                                                                                                                                                   
  } 
  
  download { "/etc/screenrc":
    uri	     => 'http://git.grml.org/f/grml-etc-core/etc/grml/screenrc_generic',
    timeout  => 900,
    contains => 'grml'
  }
  
  download { "/etc/vimrc":
    uri	     => 'http://git.grml.org/f/grml-etc-core/etc/vim/vimrc',
    timeout  => 900,
    contains => 'grml'
  }
  
  download { "/etc/zshrc":
    uri      => 'http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc',
    timeout  => 900,
    contains => 'grml'
  }

}
