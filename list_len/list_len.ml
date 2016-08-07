(* The implementation in standard library function *)

let rec length_v1 l =
    if l = [] then 0 else 1 + length_v1(List.tl l);;

let length_v2 l =
    let rec helper len = function
        | []    -> len
        | _::tl -> helper (len+1) tl
    in helper 0 l;;

(* Tests *)
print_int (length_v1 []);;
print_string "\n";;
print_int (length_v2 []);;
print_string "\n";;
print_int (length_v1 [1]);;
print_string "\n";;
print_int (length_v2 [1]);;
print_string "\n";;
print_int (length_v1 [1;2;3;4;5]);;
print_string "\n";;
print_int (length_v2 [1;2;3;4;5]);;
print_string "\n";;
