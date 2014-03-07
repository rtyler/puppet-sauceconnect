class sauceconnect($username="", $apikey="") {
  $dir = '/usr/share/sauce'

  file {
    $dir :
      ensure => directory;

    "$dir/sc" :
      ensure  => present,
      require => File[$dir],
      source  => 'puppet:///modules/sauceconnect/sc';
  }

  class {
    "sauceconnect::${osfamily}" : ;
    'sauceconnect::daemon' :
      username => $username,
      apikey   => $apikey;
  }
}
