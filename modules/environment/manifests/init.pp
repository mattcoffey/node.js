# Class: environment
#
# This module manages environment
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class environment {
    # Show how many jobs are running
    file { "/etc/environment":
        content => inline_template(
            "PS1='[\\u {\\j} \\W] '\n"
        ),
        owner   => "root",
        group   => "root",
        mode    => '0644'
    }

    # Install telnet 
    package { "telnet": 
        provider => "yum",
        ensure   => installed,
    }

    # Stop filewall for convenience
    service { "iptables":
        ensure => "stopped",
    }
}
