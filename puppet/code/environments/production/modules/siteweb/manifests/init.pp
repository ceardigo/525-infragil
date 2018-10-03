
class siteweb{

	case $::osfamily{
	"RedHat":{

		$apache = "httpd"

        	service{firewalld:
                	ensure => stopped,
                	enable => false
        	}

	}
	"Debian":{

		$apache = "apache2"

        	exec{"atualiza_pacotes2":
                	command => "/usr/bin/apt update"
        	}
	}
	}

	package{$apache:
		ensure => present
	}

	service{$apache:
		ensure => running,
		enable => false
	}        

	file{"/var/www/html/index.html":
                source => "puppet:///modules/siteweb/index.html",
                ensure => present
        }
}
