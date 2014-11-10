class mongo {

	package {"mongodb":
		ensure => installed
	}

	package {"mongodb-server":
		ensure => installed
	}

	service {"mongod":
		ensure => running,
		enable => true,
		require => Package["mongodb-server"]
	}

  file { "/etc/mongodb.conf" :
      content => "
        bind_ip = All
        port = 27017
        fork = true
        pidfilepath = /var/run/mongodb/mongodb.pid
        logpath = /var/log/mongodb/mongodb.log
        dbpath =/var/lib/mongodb
        journal = true
        nohttpinterface = false
      "
  }
}
