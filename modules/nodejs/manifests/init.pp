# Class: nodejs 
#
# https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
#
# This module manages nodejs
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class nodejs {
    
    # ordering resources inside the module
    Package["epel-release"] ->
    Package["npm"]

    # install repository
    package { "epel-release": 
        provider => "rpm",
        source   => "http://download-i2.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm"
    }

    # install node.js 
    package { "npm": 
        provider => "yum",
        ensure   => installed,
    }
}
