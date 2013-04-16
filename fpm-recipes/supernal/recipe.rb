class Celesitla < FPM::Cookery::Recipe
  description 'A one stop shop for provisioning lifecycle managment'

  name     'supernal'
  version  '0.1.0'
  source   'https://github.com/celestial-ops/supernal.git', :with => :git , :sha => '3f6c3961dac02768c15e7e27c11568dc3e8f39a8'
  arch     'all'

  depends  'java-runtime-headless'
  section  'admin'

  config_files '/etc/celestial/celestial.conf'


  def build
    safesystem('lein', 'tar')
    safesystem('tar', '-xvf', "supernal-#{version}.tar")
  end

  def install
    share('supernal/lib/').install Dir["supernal-#{version}/lib/target/*"]
    bin.install workdir('bin/supernal')
    # etc.install 'pkg/etc/celestial/celestial.edn'
    # etc('init').install_p workdir("conf/celestial.conf")
  end
end
