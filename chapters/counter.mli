open Core.Std

(** A collection of string frequency counts *)
type t

(** The empty set of frequency counts *)
val empty : t

(** Bump the frequency count for a given string *)
val touch : t -> string -> t

(** frequency counts to association list *)
val to_list : t -> (string * int) list
