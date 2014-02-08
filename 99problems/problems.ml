(* http://ocaml.org/learn/tutorials/99problems.html *)

let rec last = function
	| [] -> None
	| [x] -> Some(x)
	| _ :: xs -> last xs
;;

let rec last_two = function
	| [] | [_] -> None
	| [x; y] -> Some((x,y))
	| _ :: xs -> last_two xs
;;

let rec at k xs = match (k, xs) with
	| (_ , []) -> None
	| (1, x :: _) -> Some(x)
	| (k, _ :: xs) -> at (k-1) xs
;;

let rec at' k = function
	| [] -> None
	| x :: xs -> if k = 1 then Some(x) else at' (k-1) xs
;;

let length xs =
	let rec size' acc = function
		| [] -> acc
		| _ :: xs -> size' (acc+1) xs
	in size' 0 xs
;;

let rec rev = function
	| [] -> []
	| x :: xs -> (rev xs) @ [x]
;;

let is_palindrome a b =
	a = rev b
;;

type 'a node =
	| One of 'a
	| Many of 'a node list;;

let rec flatten = function
	| [] -> []
	| One s :: tl -> s :: flatten tl
	| Many xs :: tl -> flatten xs @ flatten tl
;;

let rec compress = function
	| [] -> []
	| [x] -> [x]
	| x :: y :: tl -> if (x <> y) then x :: (compress (y :: tl))
										else compress ( y :: tl)
;;


compress [1; 1; 1; 2; 3; 3] ;;

(* ================================= *)

last [1;2;3];;
last [];;
last_two [1;2;3;4;5];;
at 3 [1;2;3];;
length [1;2;3];;
length [];;
rev [1;2;3];;

is_palindrome [1;2] [2;1];;

flatten [ One "a" ; Many [ One "b" ; Many [ One "c" ; One "d" ] ; One "e" ] ] ;;
