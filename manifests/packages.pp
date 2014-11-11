# Install packages for several operating systems
class base::packages {
  case $::operatingsystem {
    centos, redhat: {
	$packages = ['sudo','screen','zsh','mc','wget','vim-enhanced','htop','iftop','augeas','sysstat']
    }
    debian, ubuntu: {
        $packages = ['sudo','screen','zsh','mc','curl','vim','htop','iftop','augeas-tools','sysstat']
    }
    default: {
      fail('Unrecognized operating system')
    }
  }

  package { $packages:
    ensure      => installed
  }

}
