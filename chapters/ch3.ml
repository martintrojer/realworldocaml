[1;2;3];;
1 :: [2;3];;
1 :: (2 :: (3 :: []));;
1 :: 2 :: 3 :: [];;

let plus_one_match = function
  | 0 -> 1
  | 1 -> 2
  | 2 -> 3
  | x -> x + 1
;;

let plus_one_if x =
  if x = 0 then 1
  else if x = 1 then 2
  else if x = 2 then 3
  else x + 1
;;

#require "core_bench";;
open Core_bench.Std;;

Bench.bench
  [ Bench.Test.create ~name:"plus_one_match" (fun () -> ignore (plus_one_match 10));
    Bench.Test.create ~name:"plus_one_if" (fun () -> ignore (plus_one_if 10));
  ];;

List.map2_exn ~f:Int.max [1;2;3] [3;2;1];;

List.fold ~init:0 ~f:(+) [1;2;3;4;];;

List.reduce [1;2;3;4;5] (+);;

List.filter_map [1;2;3;4;5] (fun x -> if (x mod 2) = 0 then Some(x * 2) else None);;

let length xs =
  let rec length' acc = function
    | [] -> acc
    | _ :: tl -> length' (acc + 1) tl
  in
  length' 0 xs
;;

length [1;2;3;4;5];;

let rec destutter = function
  | [] | [_] as l -> l
  | hd :: (hd' :: _ as tl) when hd = hd' -> destutter tl
  | hd :: tl -> hd :: destutter tl
;;

destutter [1;2;2;3;4;4;4;4;4;4;5];;
