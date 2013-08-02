define download ($uri, $timeout = 300) {
  exec { "download $uri":
    command => "/usr/bin/wget -q '$uri' -O $name",
    creates => $name,
    timeout => $timeout,
    require => Class[ "base::packages" ],
  }
}
