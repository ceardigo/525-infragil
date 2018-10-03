
class base{

	case $::osfamily{
	"RedHat":{

		$pacotes = ["epel-release", "git", "vim", "sysstat", "htop", "figlet"]

	}


	"Debian":{

		$pacotes = ["git", "vim", "sysstat", "htop", "figlet"]

        	exec{"atualiza_pacotes":
                	command => "/usr/bin/apt update"
        	}

	}


	}


	package{$pacotes:
		ensure => present
	}

}
