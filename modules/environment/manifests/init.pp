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
    file { '/etc/environment':
        content => inline_template(
            "PS1='[\\u {\\j} \\W] '\n"
        ),
        owner   => 'root',
        group   => 'root',
        mode    => '0644'
    }

    # Install telnet 
    package { 'telnet': 
        provider => 'yum',
        ensure   => installed,
    }

    # Vagrant specific environment configuration
    if $vagrant_vm == 'true' {
        notify { "vagrant_vm: ${vagrant_vm}": }

        # Stop filewall for convenience
        service { 'iptables':
            ensure => 'stopped',
        }
        
        # Update /etc/hosts with vagrant specific values
        file { '/etc/hosts':
            content => inline_template(
                "127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4\n",
                "::1 localhost localhost.localdomain localhost6 localhost6.localdomain6\n",
                "${vagrant_ip} ${vagrant_hostname} ${vagrant_hostname}"
            ),
            owner   => 'root',
            group   => 'root',
            mode    => '0644'
        }
    }
}
