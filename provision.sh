apt-get -y update
apt-get -y install python-software-properties

# opam
add-apt-repository ppa:avsm/ppa
apt-get -y update
apt-get -y install curl build-essential m4 ocaml opam

export OPAMROOT=/home/vagrant/.opam

opam init -y
eval `opam config env`
opam install -y core utop merlin
opam install -y async yojson core_extended core_bench cohttp cryptokit menhir

chown -R vagrant $OPAMROOT

# emacs
add-apt-repository ppa:cassou/emacs
apt-get -y update
apt-get -y install emacs24-nox emacs24-el emacs24-common-non-dfsg

# stuff

apt-get -y install git tree htop tmux

source "/vagrant/dotfiles.sh"
