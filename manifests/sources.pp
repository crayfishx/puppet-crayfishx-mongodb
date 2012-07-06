

# Set up package repos.

class mongodb::sources {

  case $::operatingsystem { 
    'Centos','Redhat','Fedora': { 
      include ::mongodb::sources::yum
    }

    'Debian','Ubuntu': { 
      include ::mongodb::sources::apt
    }

    default: { 
      fail ("Cannot determine how to set up software sources for $::operatingsystem")
    }
  }
}
