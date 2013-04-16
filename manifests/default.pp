group{ 'puppet': ensure  => present }

node default {
  class{'supernal':
    user    => 'vagrant',
    appname => 'web'
  }

  include ssh
}
