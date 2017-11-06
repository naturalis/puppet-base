# == Class: base::maintenance
#

class base::maintenance (
  $unattended_upgrades_reboot       = true,
  $autoremove_packages              = true,
  $cron                             = true,
  $maintenance_hour                 = '22',
  $maintenance_minute               = '0',
  $maintenance_weekday              = '1',
  $log_dirs                         = ['/var/log/maintenance'],
  $log_location                     = '/var/log/maintenance/maintenance.log',
) {


# Create log directory
  file {$log_dirs:
    ensure                  => 'directory',
    mode                    => '0700',
  }

# Create maintenance script
  file {'/usr/local/sbin/maintenance.sh':
    ensure                  => 'file',
    mode                    => '0700',
    content                 => template('base/maintenance.sh.erb')
  }

# create cronjob
  if ($cron == true) {
    cron { 'Server maintenance':
      command => "/usr/local/sbin/maintenance.sh >> ${log_location}",
      hour    => $base::maintenance::maintenance_hour,
      minute  => $base::maintenance::maintenance_minute,
      weekday => $base::maintenance::maintenance_weekday,
    }
  }else{
    cron { 'Server maintenance':
      ensure => absent,
    }
  }

# create logrotate rule
logrotate::rule { 'maintenance':
  path           => '/var/log/maintenance',
  rotate         => '12',
  rotate_every   => 'week',
  compress       => true,
  delaycompress  => true
}


}
