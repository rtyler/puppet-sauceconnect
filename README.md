# sauceconnect

This is the sauceconnect module, it will manage running a Sauce Connect tunnel
daemon on a host for you.


Currently it's only been truly tested on Debian family machines

### Usage

Quite simple:

```puppet
node default {
  class   {
    'sauceconnect' :
      username => 'my-sauce-account',
      apikey   => '0xdead-beef';
  }
}
```
