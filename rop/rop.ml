;; http://fsharpforfunandprofit.com/posts/recipe-part2/

type ('a, 'b) result =
  | Success of 'a
  | Failure of 'b
;;

let bind switch_function =
  fun two_track_input -> match two_track_input with
                         | Success s -> switch_function s
                         | Failure f -> Failure f
;;

let bind switch_function = function
  | Success s -> switch_function s
  | Failure f -> Failure f
;;

type request = { name:string; email:string } ;;

let validate_name1 input =
  if input.name = "" then Failure "Name must not be blank"
  else Success input
;;

let validate_name2 input =
  if String.length input.name > 50 then Failure "Name must not be longer than 50 chars"
  else Success input
;;

let validate_email input =
  if input.email = "" then Failure "Email must not be blank"
  else Success input
;;

let (>>) f g x = g(f(x));;

let combined_validation =
  validate_name1
  >> (bind validate_name2)
  >> (bind validate_email)
;;

combined_validation {name = "foo"; email = ""};;

let (>>=) two_track_input switch_function =
  bind switch_function two_track_input
;;

let (|>) x f = f(x) ;;

let combined_validation x =
  x
  |> validate_name1
  >>= validate_name2
  >>= validate_email
;;

combined_validation {name = "foo"; email = "bar"};;

let canonical_email input =
  { input with email = input.email |> String.lowercase  }
;;

let switch f x =
  f x |> Success;;

bind (switch canonical_email);;

let usecase =
  combined_validation
  >> bind (switch canonical_email)
;;

usecase {name = "foo"; email = "BAR"};;

let map one_track_function = function
  | Success s -> Success (one_track_function s)
  | Failure f -> Failure f
;;

let usecase =
  combined_validation
  >> map canonical_email
;;

let tee f x =
  f x;
  print_endline "Writing to DB";
  x
;;

let update_database input = ();;

let usecase =
  combined_validation
  >> map canonical_email
  >> tee update_database
;;

usecase {name = "foo"; email = "BAR"};;

let try_catch f x =
  try
    f x |> Success
  with
  | ex -> Failure ex
;;

let usecase =
  combined_validation
  >> map canonical_email
  >> try_catch (tee update_database)
;;
