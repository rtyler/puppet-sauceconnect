node default {
  group {
    'puppet' :
      ensure => present;
  }

  class {
    'sauceconnect' : ;
  }
}
