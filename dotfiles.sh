echo "
(* Added by OPAM. *)
let () =
  try Topdirs.dir_directory (Sys.getenv \"OCAML_TOPLEVEL_PATH\")
  with Not_found -> ()
;;

#use \"topfind\";;
#thread;;
#camlp4o;;
#require \"core.top\";;
#require \"core.syntax\";;
open Core.Std
" >> .ocamlinit

echo "
[user]
  name = Martin Trojer
  email = martin.trojer@gmail.com
[color]
  ui = true
[http]
  sslVerify = false
  postBuffer = 524288000
" > .gitconfig

echo ". /home/vagrant/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true" >> .bashrc

echo "setw -g xterm-keys on
setw -g default-terminal \"screen-256color\"" > .tmux.conf

if [ ! -d .emacs.d ]; then
  git clone https://github.com/martintrojer/.emacs.d.git
fi

chown -R vagrant /home/vagrant/.emacs.d
