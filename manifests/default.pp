node default {

  include apt
  include langs::node

  package{'sysstat':
    ensure  => present
  }

  package{'stress':
    ensure  => present
  }

  package{'openjdk-8-jre-headless':
    ensure  => present
  }
}
