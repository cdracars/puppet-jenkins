class jenkins {
  package {
    'jre':
        ensure => '1.7.0',
        noop   => true
  }
  include jenkins::repo
  include jenkins::package
  include jenkins::service
  include jenkins::firewall
  include jenkins::configure

  Class['jenkins::repo'] -> Class['jenkins::package'] 
  -> Class['jenkins::configure'] -> Class['jenkins::service']

}


