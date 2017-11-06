puppet-base
===================

Puppet module to install basic system management tools and regular system maintenance tasks

For more information using this tool: https://github.com/naturalis/puppet-base

Parameters
-------------
All parameters are read from defaults in code or retrieved from the Foreman. 

Classes
-------------
- base
- base::packages
- base::users
- base::config
- base::download
- base::maintenance

Dependencies
-------------
- puppetlabs/puppetlabs-stdlib
- rodjek/puppet-logrotate


Examples
-------------
For usage in the foreman baseusers and applicationusers can be changed by setting override for users_hash and application_users_hash, change the content "hiera_based" to the users hash. 


Hiera yaml
```

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
applicationusers:
 letmein2:
   comment: "Let me In also"
   shell: "/bin/zsh"
   ssh_key:
    type: "ssh-rsa"
    comment: "let@me.in2"
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
curl https://raw.githubusercontent.com/naturalis/puppet/master/private/scripts/cloud-puppet.sh > cloud-puppet.sh; chmod +x cloud-puppet.sh;./cloud-puppet.sh base
```
Openstack / nova client
```
wget https://github.com/naturalis/puppet/raw/master/private/scripts/cloud-data
nova boot --user-data cloud-data --meta role=base --flavor m1.tiny --key-name adminkey --image raring-x86-64 base-raring
```
Result
-------------
This module installs:
- sudo
- screen
- zsh
- mc
- curl
- vim
- htop
- iftop
- ntp
- systat

For debian os family systems this module also installs the nl_NL.UTF8 locale using the locale-gen command. The exec resource can be found in manifests/config.pp

For every user in the hiera data (see hiera example) this module create the user and copy basic files as .screenrc and ssh keys to the user home dir.

mc (Midnight Commander) will be configured with customized defaults, skin used is the "dark" skin and puppet syntax highlighting functionality will be added for .pp and .erb files.

Limitations
-------------
This module has been built on and tested against Puppet 3.2.3. On Ubuntu 10.04 a backported libaugeas-ruby must be installed to prevent errors like: Error: /Stage[main]/Base::Config/Augeas[sudowheel]: Could not evaluate: uninitialized constant Augeas::NO_LOAD 
backport can be downloaded at: http://packages.ubuntu.com/lucid-backports/amd64/libaugeas-ruby1.8/download , use dpkg -i {package file name} to install version 0.3.0 or higher. 

The module has been tested on:
- CentOS 6.5
- CentOS 6.4
- CentOS 6.3
- Ubuntu 10.04 lucid * read limitation
- Ubuntu 12.04 precise
- Ubuntu 13.04 raring
- Ubuntu 13.10 saucy
- Ubuntu 14.04 trusty
- Ubuntu 16.04 xenial

Authors
-------------
- Paul Gomersbach <p.gomersbach@gmail.com>
- Rudi Broekhuizen <r.broekhuizen@naturalis.nl>
- Hugo van Duijn <hugo.vanduijn@naturalis.nl>
- Atze de Vries <atze.devries@naturalis.nl>
- Foppe Pieters <foppe.pieters@naturalis.nl>

