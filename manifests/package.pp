

class mongodb::package { 

  if ( $::mongodb::packagename != '' ) { 
    $pkg = $::mongodb::packagename
  } else {
    case $::operatingsystem { 
      'centos','redhat','fedora': { 
        $pkg = 'mongo-10gen-server' 
      }
      'debian','ubuntu': { 
        $pkg = 'mongodb-10gen'
      }
      default: { 
        fail ("Cannot determine a default package name for mongo, please provide a packagename parameter")
      }
    }
  }
 
  package { 'mongodb-10gen': 
    name    => $pkg,
    ensure  => installed,
  }

}
