node default {

  include apt
  package{'sysstat':
    ensure  => present
  }

  package{'stress':
    ensure  => present
  }

  package{'openjdk-8-jre-headless':
    ensure  => present
  }

  # Shim

  include git
  include langs::node
  include build::lein

  package{'build-essential':
    ensure  => present
  }
  file{'/home/re-ops/code/':
    ensure => directory,
  }

  -> git::clone {'shim':
    url   => 'git://github.com/narkisr/shim.git',
    dst   => '/home/re-ops/code/shim',
    owner => re-ops
  }

}
