

class mongodb::sources::apt { 

  $locations = { 
    'sysv'    =>  'http://downloads-distro.mongodb.org/repo/debian-sysvinit',
    'upstart' =>  'http://downloads-distro.mongodb.org/repo/ubuntu-upstart'
  }

  
  if ( $::mongodb::init == '' ) { 
    $location = $::operatingsystem ? {
      'Ubuntu'  => $locations['upstart'],
      'Debian'  => $locations['sysv']
    }
  } else {
    $location = $locations[$::mongodb::init]
  }


  apt::source { '10gen':
    location    => $location,
    release     => 'dist',
    repos       => '10gen',
    key         => '7F0CEB10',
    key_server  => 'keyserver.ubuntu.com',
    include_src => false,
    before      => Package['mongodb-10gen']
  }
}



