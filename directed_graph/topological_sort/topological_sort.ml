(* Topological sort *)

let edges = [
    ("a", "b"); ("a", "c");
    ("a", "d"); ("b", "e");
    ("c", "f"); ("d", "e");
    ("e", "f"); ("e", "g")
];;

let successors n edges =
    let matching (s,_) = s = n in 
    List.map snd(List.filter matching edges);;

let rec tsort_v1 edges visited = function
    | []       -> visited
    | n::nodes ->
        let visited' = if List.mem n visited then visited
                       else n :: tsort_v1 edges visited (successors n edges)
        in tsort_v1 edges visited' nodes;;

(* Tests *)
print_string "Start from a\n";;
List.iter ( fun n -> print_string n; print_newline () )
    (tsort_v1 edges [] ["a"]);;

let cycles = [
    ("a","b");
    ("b","c");
    ("c","a")
];;

(* Tests that will fail by Stack Overflow*)
(*
print_string "Cycles start from a\n";;
List.iter ( fun n -> print_string n; print_newline () )
    (tsort_v1 cycles [] ["a"]);;
*)

exception Cyclic of string

let tsort_v2 edges seed =
    let rec sort path visited = function
        | []       -> visited
        | n::nodes ->
            if List.mem n path then raise (Cyclic n) else
            let v' = if List.mem n visited then visited else
                     n :: sort (n::path) visited (successors n edges)
            in sort path v' nodes
    in
    sort [] [] [seed];;

(* Tests *)
print_string "Verion 2 Start from a\n";;
List.iter ( fun n -> print_string n; print_newline () )
    (tsort_v2 edges "a");;

print_string "Verion 2 Start from d\n";;
List.iter ( fun n -> print_string n; print_newline () )
    (tsort_v2 edges "d");;

print_string "Verion 2 Cycles Start from a\n";;
List.iter ( fun n -> print_string n; print_newline () )
    (tsort_v2 cycles "a");;


