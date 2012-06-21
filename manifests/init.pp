class sauceconnect($username="", $apikey="") {
  $dir = '/usr/share/sauce'

  file {
    $dir :
      ensure => directory;

    "$dir/Sauce-Connect.jar" :
      ensure  => present,
      require => File[$dir],
      source  => 'puppet:///modules/sauceconnect/Sauce-Connect.jar';
  }

  class {
    "sauceconnect::${osfamily}" : ;
    'sauceconnect::daemon' :
      username => $username,
      apikey   => $apikey;
  }
}
