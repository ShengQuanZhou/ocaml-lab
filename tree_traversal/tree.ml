type 'a tree = {
    value: 'a;
    children: 'a tree list;
};;

let t1 = {
    value = 1;
    children = [
        { 
            value = 2; 
            children = [
                { value = 6; children = [] };
                { value = 4; children = [] }
            ] 
        };

        { 
            value = 3; 
            children = [
                { value = 7; children = [] };
                { value = 9; children = [] }
            ] 
        }
    ]
};;

let t2 = {
    value = 1;
    children = []
};;

let rec traverse t = match t with
    | { children = []; value = v } -> [v]
    | { children = [a;b]; value = v } -> v::traverse a @ traverse b

let l = traverse t1;;
