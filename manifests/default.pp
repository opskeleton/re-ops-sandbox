node default {
  include apt
  include git
  include langs::node
  include build::lein
  include shell
  include baseline
  include vim
  include barbecue


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

  -> git::clone {'re-base':
    url   => 'git://github.com/re-ops/re-base.git',
    dst   => '/home/re-ops/code/re-base',
    owner => re-ops
  }

}
