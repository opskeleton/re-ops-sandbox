group{ 'puppet': ensure  => present }

node supernal {
  class{'supernal':
    user    => 'vagrant',
    appname => 'web'
  }

  include ssh
}
