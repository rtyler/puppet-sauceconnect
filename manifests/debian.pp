class sauceconnect::debian {
  package {
    'openjdk-6-jre' :
      ensure => present;
  }
}
