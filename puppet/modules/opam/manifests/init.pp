class opam::deps {
  package { 'curl' : ensure => present }
  package { 'build-essential' : ensure => present }
  package { 'm4' : ensure => present }

  apt::ppa { 'ppa:avsm/ppa':
    before => Package['ocaml'],
  }

  package { 'ocaml' : ensure => present }
  ->
  package { 'opam' : ensure => present }
}

class opam {

  require deps

  Exec {
    environment => [ 'OPAMROOT=/home/vagrant/.opam' ],
    cwd => '/home/vagrant',
  }

  exec { 'opam init' :
    user => vagrant,
    command => '/usr/bin/opam init -y',
    creates => '/home/vagrant/.opam',
    require => Package['opam'],
  }
  ->
  exec { 'opam packages' :
    user => vagrant,
    command => '/usr/bin/opam install -y utop async yojson core_extended core_bench cohttp cryptokit menhir merlin',
    timeout => 0,
  }
}
