define dotfiles::link {
  $parts = split($title, '/')
  file { $title :
    ensure => link,
    target => sprintf("/home/vagrant/dotfiles/%s", $parts[-1]),
    require => Exec['dotfiles'],
  }
}

class dotfiles {

  file_line { '.bashrc':
    path => '/home/vagrant/.bashrc',
    line => '. /home/vagrant/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true'
  }

  package { 'git' : ensure => present }
  ->
  exec { 'dotfiles' :
    cwd => '/home/vagrant',
    user => vagrant,
    command => '/usr/bin/git clone https://github.com/martintrojer/dotfiles.git',
    creates => '/home/vagrant/dotfiles',
  }

  link { '/home/vagrant/.tmux.conf' : }
  link { '/home/vagrant/.gitconfig' : }
  link { '/home/vagrant/.ocamlinit' : }
  link { '/home/vagrant/.emacs.d' : }

}
