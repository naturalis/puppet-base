puppet-base
===================

Puppet module to install basic system management tools

For more information using this tool: https://github.com/naturalis/puppet-base

Parameters
-------------
All parameters are read from hiera

Classes
-------------
- 

Dependencies
-------------
- 

Examples
-------------
Hiera yaml
```
sample1:
    param: 'sampledata'
```
Puppet code
```
class { thisclass: }
```
Standalone
```
curl https://raw.github.com/naturalis/puppet/master/private/scripts/cloud-puppet.sh > cloud-puppet.sh; chmod +x cloud-puppet.sh;./cloud-puppet.sh base
```
Result
-------------


Limitations
-------------
This module has been built on and tested against Puppet ... and higher.

The module has been tested on:
- 
- 

Authors
-------------
Author Name <p.gomersbach@gmail.com>

