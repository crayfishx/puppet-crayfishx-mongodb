

class mongodb::service { 
  
  if ( $::mongodb::servicename == "" ) { 

    case $::operatingsystem { 
      'Redhat','Centos':  { 
        $servicename = "mongod"
      } 
      default: { 
        $servicename = "mongodb"
      }
    }
  } else { 
      $servicename = $::mongodb::servicename
  }



  service { "mongodb":
    name      => $servicename,
    ensure    => running,
    require   => Package['mongodb-10gen'],
  }
}


