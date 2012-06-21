class sauceconnect {
  package {
    'sauce' :
      ensure   => present,
      provider => gem;
  }


  class {
    "sauceconnect::${osfamily}" : ;
  }
}
