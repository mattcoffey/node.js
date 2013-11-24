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
    file { "/etc/environment":
        content => inline_template(
            "PS1='[\\u {\\j} \\W] '\n"
        ),
        owner   => "root",
        group   => "root",
        mode    => '0644'
    }
}
