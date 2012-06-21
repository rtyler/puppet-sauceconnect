class sauceconnect::daemon {
  $logdir = '/var/log/sauce'

  file {
    $logdir :
      ensure => directory;

    '/etc/default/sauce-connect' :
      ensure => present,
      source => 'puppet:///modules/sauceconnect/etc_default_sauce-connect';

    '/etc/init.d/sauce-connect' :
      ensure => 'present',
      notify => Service['sauce-connect'],
      source => 'puppet:///modules/sauceconnect/init.d_sauce-connect';
  }

  service {
    'sauce-connect' :
      ensure     => running,
      hasrestart => true,
      hasstatus  => true;
  }
}
