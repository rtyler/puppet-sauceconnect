class sauceconnect {
  package {
    'sauce' :
      ensure   => present,
      provider => gem;
  }
}
