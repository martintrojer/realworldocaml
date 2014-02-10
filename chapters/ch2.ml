(fun a -> a + 1) 42;;

let a = 42 in a + 1;;

List.map ~f:(fun a -> a + 1) [1;2;3];;
List.map [1;2;3] (fun a -> a + 1);;

let abs_diff x y = abs (x - y);;
let abs_diff = (fun x -> (fun y -> abs (x - y)));;

let abs_diff (x, y) = abs (x - y);;

let rec is_even x =
	if x = 0 then true else is_odd (x - 1)
	and is_odd x =
		if x = 0 then false else is_even(x - 1);;

List.map ~f:is_even (List.range 0 10);;
List.map ~f:is_odd (List.range 0 10);;

3 + 4;;
(+) 3 4;;

let (+!) (x1,y1) (x2, y2) = (x1 + x2, y1 + y2);;
(3,2) +! (-2, 4);;

(* let (|>) x f = f x *)

let path = "/usr/bin:/usr/local/bin:/bin:/sbin";;
String.split ~on:':' path
|> List.dedup ~compare:String.compare
|> List.iter ~f:print_endline;;

(* ======================================== *)

let ratio ~num ~denom = float num /. float denom;;

ratio ~denom:1 ~num:2;;

(ratio ~denom:2) ~num:43;;

let num = 3 in
		let denom = 4 in
		ratio ~num ~denom;;

let concat ?sep x y =
	let sep = match sep with None -> "" | Some x -> x in
	x ^ sep ^ y;;

concat ~sep:"--" "foo" "bar";;

let concat ?(sep="") x y = x ^ sep ^ y;;
