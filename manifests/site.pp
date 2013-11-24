import 'node.pp'

# Debug Invokation from Vagrant VM with:
# sudo puppet apply --modulepath=/vagrant/modules /vagrant/manifests/site.pp --debug --verbose --trace --summarize

# Run provisioning from vagrant directory with:
# vagrant provision

# set a default $PATH for all execs
Exec {
    path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] 
}

# Declare variables here

