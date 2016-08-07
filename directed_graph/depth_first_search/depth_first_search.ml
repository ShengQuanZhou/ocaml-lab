(* Traverse the nodes in depth-first way *)

let edges = [
    ("a", "b"); ("a", "c");
    ("a", "d"); ("b", "e");
    ("c", "f"); ("d", "e");
    ("e", "f"); ("e", "g")
];;

let successors n edges =
    let matching (s,_) = s = n in 
    List.map snd(List.filter matching edges);;

let rec dfs edges visited = function
    | [] -> List.rev visited
    | n::nodes ->
        if List.mem n visited then
            dfs edges visited nodes
        else
            dfs edges (n::visited) ((successors n edges) @ nodes);;

(* Tests *)
print_string "Start from a\n";;
List.iter ( fun n -> print_string n; print_newline () )
    (dfs edges [] ["a"]);;
print_string "Start from e\n";;
List.iter ( fun n -> print_string n; print_newline () )
    (dfs edges [] ["e"]);;
print_string "Start from d\n";;
List.iter ( fun n -> print_string n; print_newline () )
    (dfs edges [] ["d"]);;
