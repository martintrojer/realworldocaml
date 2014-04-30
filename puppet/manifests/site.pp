import 'puppetlabs-stdlib'

include opam
include dotfiles

package { ['emacs24-nox', 'emacs24-el', 'emacs24-common-non-dfsg'] : ensure => present }
package { ['tree', 'htop', 'tmux'] : ensure => present }
