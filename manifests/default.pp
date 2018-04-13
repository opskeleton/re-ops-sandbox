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

  # re-conf

  include git
  include langs::node
  include build::lein

  package{'build-essential':
    ensure  => present
  }
  file{'/home/re-ops/code/':
    ensure => directory,
    mode   => 'a+rw'
  }

  -> git::clone {'re-conf':
    url   => 'git://github.com/re-ops/re-conf.git',
    dst   => '/home/re-ops/code/re-conf',
    owner => re-ops
  }

}
