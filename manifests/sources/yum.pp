

class mongodb::sources::yum { 
  yumrepo { '10gen':
    baseurl   => "http://downloads-distro.mongodb.org/repo/redhat/os/${::architecture}",
    gpgcheck  => '0',
    enabled   => '1',
  } -> Package['mongodb-10gen']
}


