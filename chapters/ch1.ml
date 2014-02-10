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

(fun a -> a + 1) 42;;

(* ======================================== *)

let a_tuple = (3, "three");;
let (x,y) = a_tuple;;
x + String.length y;;

let langs_tuple = ["OCaml", "Perl", "C"];;
let langs = ["OCaml"; "Perl"; "C"];;

List.map langs ~f:String.length;;

"French" :: "Spanish" :: langs;;

[1;2;3] @ [4;5;6];;

let my_fav_lang = function
	| hd :: tl -> hd
	| [] -> "OCaml"
;;

let rec destutter = function
	| [] -> []
	| [hd] -> [hd]
	| hd1 :: hd2 :: tl ->
		 if hd1 = hd2 then destutter (hd2 :: tl)
		 else hd1 :: destutter (hd2 :: tl)
;;

destutter [1;1;2;2;3;4;4;5];;

List.map ~f:(fun a -> a + 1) [1;2;3];;

(* ======================================== *)

let div x y = if y = 0 then None else Some(x/y);;
div 1 2;;
div 1 0;;

let x = 7 in
		x + x;;

let x = 7 in
		let y = x * x in
		x + y ;;

(* ======================================== *)

type point2d = { x: float; y: float};;
let p = { x = 3.; y = -4. };;
p.y;;

let magnitude { x = x_pos; y = y_pos } =
	sqrt (x_pos ** 2. +. y_pos ** 2.);;
let magnitude { x;y } = sqrt (x ** 2. +. y ** 2.);;

let distance v1 v2 =
	magnitude { x = v1.x -. v2.x; y = v1.y -. v2.y };;

type circle_desc = { center: point2d; radius: float };;
type rect_desc = {lower_left: point2d; width: float; height: float};;
type segment_desc = {endpoint1: point2d; endpoint2: point2d};;

type scene_element =
	| Circle of circle_desc
	| Rect of rect_desc
	| Segment of segment_desc;;

let is_inside_scene_element point = function
	| Circle { center; radius } ->
		 distance center point < radius
	| Rect { lower_left; width; height } ->
		 point.x    > lower_left.x && point.x < lower_left.x +. width
		 && point.y > lower_left.y && point.y < lower_left.y +. height
	| Segment { endpoint1; endpoint2 } -> false
;;

let is_inside_scene point scene =
	List.exists scene ~f:(fun el -> is_inside_scene_element point el);;

is_inside_scene {x=3.;y=7.} [ Circle {center = {x=4.;y=4.}; radius = 0.5}];;
is_inside_scene {x=3.;y=7.} [ Circle {center = {x=4.;y=4.}; radius = 5.}];;

(* ======================================== *)

let nums = [| 1; 2; 3; 4 |];;
nums.(2) <- 4;;

type running_sum =
		{ mutable sum: float;
			mutable sum_sq: float;
			mutable samples: int;};;

let mean rsum = rsum.sum /. float rsum.samples;;
let stdev rsum = sqrt (rsum.sum_sq /. float rsum.samples
											-. (rsum.sum /. float rsum.samples) ** 2.);;

let create() = { sum = 0.; sum_sq = 0.; samples = 0 };;
let update rsum x = rsum.samples <- rsum.samples + 1;
										rsum.sum     <- rsum.sum +. x;
										rsum.sum_sq  <- rsum.sum_sq +. x *. x;;

let rsum = create ();;
List.iter [1.;3.;2.;-7.;4.;5.] ~f:(fun x -> update rsum x);;
mean rsum;;

(* ======================================== *)

let y = { contents = 0 };;
y.contents <- 1;;

let x = ref 0;;
!x;;
x := !x + 1;;

let sum list =
	let sum = ref 0 in
	List.iter list ~f:(fun x -> sum := !sum + x);
	!sum
;;

let time f x =
	let start = Unix.gettimeofday() in
	let res = f x in
	let stop = Unix.gettimeofday() in
	let () = Printf.printf "Elapsed time: %f\n%!" (stop -. start) in
	res
		;;

let nums = List.range 0 100000;;

time sum nums;;

time List.fold_left ~init:0 ~f:(+) nums;;

(* ======================================== *)

let ar = Array.init 20 ident;;

let permute array =
	let length = Array.length array in
	for i = 0 to length - 2 do
		let j = i + Random.int (length - 1) in
		let tmp = array.(i) in
		array.(i) <- array.(j);
		array.(j) <- tmp
	done;;

permute ar;;
