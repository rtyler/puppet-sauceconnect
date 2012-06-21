class sauceconnect::daemon($username, $apikey) {
  $logdir = '/var/log/sauce'

  file {
    $logdir :
      ensure => directory;

    '/etc/default/sauce-connect' :
      ensure  => present,
      content => "
JAVA=/usr/lib/jvm/java-6-openjdk/jre/bin/java
SAUCE_CONNECT=/usr/share/sauce/Sauce-Connect.jar
API_USER=${username}
API_KEY=${apikey}
USERNAME=
GROUP=
LOG_DIR=${logdir}
";

    '/etc/init.d/sauce-connect' :
      ensure => 'present',
      mode   => 0755,
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
