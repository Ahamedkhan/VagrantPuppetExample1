
node 'vagrant' {

include stdlib

$App = 'ahamedkhan.co.uk'
$ApplicationLocation = "/var/www/${App}"

# Firewall ports for NGINX

   firewall { '100 allow HTTP Port':
    chain   => 'INPUT',
    state   => ['NEW'],
    dport   => [8080],
    proto   => 'tcp',
    action  => 'accept',
   }


# git clone

    
    package { 'git' : ensure => present }

	vcsrepo { $ApplicationLocation:
        ensure   => present,
        provider => git,
        source   => 'https://github.com/puppetlabs/exercise-webpage.git'
    }

   
# install the right Java version
class { 'java' :
  package => 'java-1.8.0-openjdk-devel',
}

# install Tomcat

tomcat::install { '/opt/tomcat':
  source_url => 'http://mirror.ox.ac.uk/sites/rsync.apache.org/tomcat/tomcat-8/v8.5.4/bin/apache-tomcat-8.5.4.tar.gz',
}
tomcat::instance { 'default':
  catalina_home => '/opt/tomcat',
}
  




}