Various snippets while reading http://realworldocaml.org

My setup is Vagrant and Emacs ([Tuareg](http://www.emacswiki.org/emacs/TuaregMode) and [utop](https://github.com/diml/utop))

## Usage

```
$ git submodule init
$ git submodule update
$ vagrant box add trusty64 https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box
$ vagrant up
```

It takes a long time to compile all opam packages, be patient.


You may want to change `puppet/modules/dotfiles`
