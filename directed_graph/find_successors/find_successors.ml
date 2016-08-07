(* Find successors to a node in a directed graph *)

let edges = [
    ("a", "b"); ("a", "c");
    ("a", "d"); ("b", "e");
    ("c", "f"); ("d", "e");
    ("e", "f"); ("e", "g")
];;

let rec successors_v1 n = function
    | [] -> []
    | (s,t) :: edges -> 
        if s = n then
            t :: successors_v1 n edges
        else
            successors_v1 n edges;;

let successors_v2 n edges =
    let matching (s,_) = s = n in 
    List.map snd(List.filter matching edges);;

(* Tests *)
print_string "Method 1 - Successors of a:\n";;
List.iter ( fun n -> print_string n; print_newline () )
    ( successors_v1 "a" edges );;
print_string "Successors of b:\n";;
List.iter ( fun n -> print_string n; print_newline () )
    ( successors_v1 "b" edges );;

print_string "Method 2 - Successors of a:\n";;
List.iter ( fun n -> print_string n; print_newline () )
    ( successors_v2 "a" edges );;
print_string "Successors of b:\n";;
List.iter ( fun n -> print_string n; print_newline () )
    ( successors_v2 "b" edges );;

