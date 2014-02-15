class dotfiles {

  File {
    owner => vagrant,
    group => vagrant,
    mode => 0644,
  }

  file { '.ocamlinit' :
    name => '/home/vagrant/.ocamlinit',
    ensure => present,
    source => 'puppet:///modules/dotfiles/.ocamlinit',
  }

  file { '.gitconfig' :
    name => '/home/vagrant/.gitconfig',
    ensure => present,
    source => 'puppet:///modules/dotfiles/.gitconfig',
  }

  file { '.tmux.conf' :
    name => '/home/vagrant/.tmux.conf',
    ensure => present,
    source => 'puppet:///modules/dotfiles/.tmux.conf',
  }

  file_line { '.bashrc':
    path => '/home/vagrant/.bashrc',
    line => '. /home/vagrant/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true'
  }

  package { 'git' : ensure => present }

  exec { '.emacs.d' :
    cwd => '/home/vagrant',
    user => vagrant,
    command => '/usr/bin/git clone https://github.com/martintrojer/.emacs.d.git',
    creates => '/home/vagrant/.emacs.d',
    require => Package['git'],
  }
}
