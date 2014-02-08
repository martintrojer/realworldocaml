3+4;;

8/3;;

3.5 +. 6.;;

let x = 3 + 4;;
let y' = x + x;;
let _z = y';;

(* ======================================== *)

let square x = x * x;;
square 2;;
square (square 2);;

let ratio x y = Float.of_int x /. Float.of_int y;;
ratio 4 7;;

let sum_if_true test first second =
  (if test first then first else 0) +
	 (if test second then second else 0)
;;

let even x = x mod 2 = 0;;

sum_if_true even 3 4;;

let first_if_true test x y =
  if test x then x else y
;;

let long_string s = String.length s > 6 ;;
let big_number n = n > 666 ;;

first_if_true long_string "short" "loooong";;
first_if_true big_number 4 5 ;;

(* ======================================== *)

List.map ~f:(fun a -> a + 1) [1;2;3];;

(fun a -> a + 1) 42;;
