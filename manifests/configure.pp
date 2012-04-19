class jenkins::configure {
  file {
    '/var/lib/jenkins/.gitconfig':
      source => 'puppet:///modules/jenkins/gitconfig',
      owner => 'jenkins',
      group => 'nogroup',
      require => Class['jenkins::package'];
    '/var/lib/jenkins/hudson.plugins.seleniumhq.SeleniumhqBuilder.xml':
      source => 'puppet:///modules/jenkins/config.selenium.xml',
      owner => 'jenkins',
      group => 'nogroup',
      require => Class['jenkins::package'];
    '/etc/default/jenkins':
      source => 'puppet:///modules/jenkins/jenkins',
      owner => 'jenkins',
      group => 'nogroup',
      require => Class['jenkins::package'];
  }

  exec {
    'jenkins-drupal-template':
      command => 'git clone git://github.com/cdracars/jenkins-drupal-template.git drupal-template && chown -R jenkins:nogroup drupal-template/',
      cwd     => '/var/lib/jenkins/jobs',
      creates => '/var/lib/jenkins/jobs/drupal-template',
      require => Class['jenkins::package'];
    'jenkins-selenium-template':
      command => 'git clone git://github.com/cdracars/jenkins-selenium-template.git selenium-template && chown -R jenkins:nogroup selenium-template/',
      cwd     => '/var/lib/jenkins/jobs',
      creates => '/var/lib/jenkins/jobs/selenium-template',
      require => Class['jenkins::package'];
  }

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
