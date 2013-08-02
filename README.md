puppet-base
===================

Puppet module to install basic system management tools

For more information using this tool: https://github.com/naturalis/puppet-base

Parameters
-------------
All parameters are read from hiera

Classes
-------------
- base
- base::packages
- base::users
- base::config

Dependencies
-------------
- repoforge
- ntp

Examples
-------------
Hiera yaml
```
ntp::servers:
  - 0.nl.pool.ntp.org
  - 1.nl.pool.ntp.org
  - 2.nl.pool.ntp.org
  - 3.nl.pool.ntp.org

baseusers:
 letmein:
   comment: "Let me In"
   shell: "/bin/zsh"
   ssh_key:
    type: "ssh-rsa"
    comment: "let@me.in"
    key: "AAAAB3NzaC1yc2EAAAABIwAAAQEAqnrrjV9ge602ChzGnhNCJDWKp1rI0Zwb64yr8evY5ozINNzyHaWGwp20JRQbPmwhd3TQDPI3hQ48n8fTagCGKRUnim25A9Fmx25viXDA7VjmfmJvC11zZgP+7cGploLcU3aOKABOpNu38tOqcI2oUgy
J9b/H7/re/QT6HutOeLuoKUtctEflWWpYmpYfXlSFrvCmrI11cVLAA6ORuV7HaWitUe6e85bv+Wxu7RICUf4HNjZRJaZdDZkaR55Y+C147qc9VcCJuJFQbOjdhocxr9AJX0ECSeW5aooB3MOvefuCxXSlCgtQTczJhJiXUo97W+/SqzupB57Ju+jnK2Xw
bQ=="
```
Puppet code
```
class { base: }
```
Standalone
```
curl https://raw.github.com/naturalis/puppet/master/private/scripts/cloud-puppet.sh > cloud-puppet.sh; chmod +x cloud-puppet.sh;./cloud-puppet.sh base
```
Result
-------------


Limitations
-------------
This module has been built on and tested against Puppet 3.2.3.

The module has been tested on:
- CentOS 6.4
- CentOS 6.3
- Ubuntu 12.04 precise

Authors
-------------
Author Name <p.gomersbach@gmail.com>

