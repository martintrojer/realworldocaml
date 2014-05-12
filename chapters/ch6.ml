type 'a expr =
  | Base  of 'a
  | Const of bool
  | And   of 'a expr list
  | Or    of 'a expr list
  | Not   of 'a expr
;;

let and_ l =
  if List.mem l (Const false) then Const false
  else
    match List.filter l ~f:((<>) (Const true)) with
    | [] -> Const true
    | [x] -> x
    | l -> And l

let or_ l =
  if List.mem l (Const true) then Const true
  else
    match List.filter l ~f:((<>) (Const false)) with
    | [] -> Const false
    | [x] -> x
    | l -> Or l

let not_ = function
  | Const b -> Const (not b)
  | e -> Not e
;;

let rec simplify = function
  | Base _ | Const _ as x -> x
  | And l -> and_ (List.map ~f:simplify l)
  | Or l  -> or_ (List.map ~f:simplify l)
  | Not e -> not_ (simplify e)
;;

simplify (Not (And [ Or [Base "its snowing"; Const true];
                     Base "its raining"]));;

simplify (Not (And [ Or [Base "its snowing"; Const true];
                     Not (Not (Base "its raining"))]));;

let not_ = function
  | Const b -> Const (not b)
  | Not e -> e
  | e -> Not e
;;
