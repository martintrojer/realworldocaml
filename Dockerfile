FROM ubuntu:trusty

RUN apt-get -y update
RUN apt-get -y install emacs24-nox emacs24-el emacs24-common-non-dfsg
RUN apt-get -y install git tmux curl silversearcher-ag tree htop unzip wget
RUN apt-get -y install build-essential curl m4 zlib1g-dev libssl-dev

RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:avsm/ppa
RUN apt-get -y update
RUN apt-get -y install camlp4 ocaml opam

# users
ENV USERNAME martin
ENV GITHUB_NAME martintrojer

RUN adduser --disabled-password --gecos '' $USERNAME
WORKDIR /home/$USERNAME
USER $USERNAME
ENV TERM xterm-256color

RUN git clone https://github.com/$GITHUB_NAME/dotfiles.git
RUN dotfiles/.bootstrap.sh -f
RUN emacs --daemon

ENV OCAML_VERSION 4.02.1

RUN opam init -y
RUN opam switch $OCAML_VERSION
RUN opam install -y utop async yojson core_extended core_bench cohttp cryptokit menhir merlin

RUN echo $(opam config env) >> .bashrc
