# Download a file from a given url
#
define base::download ($uri, $timeout = 300) {
  exec { "download ${uri}":
    command => "/usr/bin/wget -N -q '${uri}' -O ${name}",
    timeout => $timeout,
    require => Class[ 'base::packages' ],
    unless  => "/usr/bin/test -f ${name}"
  }
}
