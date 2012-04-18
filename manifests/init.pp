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
  -> Class['jenkins::service'] -> Class['jenkins::configure']

  jenkins::plugin {
    'analysis-core':;
    'checkstyle':;
    'dry':;
    'phing':;
    'plot':;
    'pmd':;
    'build-timeout':;
    'claim':;
    'disk-usage':;
    'email-ext':;
    'favorite':;
    'git':;
    'envinject':;
    'jobConfigHistory':;
    'project-stats-plugin':;
    'redmine':;
    'seleniumhq':;
    'statusmonitor':;
    'instant-messaging':;
    'jabber':;
    'tasks':;
    'warnings':;
  }

}


