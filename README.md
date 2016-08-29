# ocaml-lab
Study notes and exercises of Objective Caml.

First steps in OCaml

Let us first check the “Hello world” program. 
Use the editor to create a file hello.ml containing the following single line:
    	 	
  print_string "Hello world!\n";;

Then, compile and execute the program as follows:
    	 	
  ocamlc -o hello hello.ml
  ./hello
    	 	
  Hello World

Alternatively, the same program could have been typed interactively, 
using the interpreter ocaml as a big desk calculator, 
as shown in the following session:
    	 	
  ocaml
    	 	
        Objective Caml version 3.00
  #
    	 	
  print_string "hello world!\n";;
    	 	
  hello world!
  - : unit = ()

To end interactive sessions type ^D (Control D) or 
call the exit function of type int -> unit:
    	 	
  exit 0;;

Note that the exit function would also terminate the execution in a compiled 
program. Its integer argument is the return code of the program 
(or of the interpreter).

Exercise 33 ((*) Unix commands true and false)   
Write the Unix commands true et false that do nothing but return the codes 0 
and 1, respectively.

Answer:
    	 	
  exit 0;; 	
  exit 1;;

The interpreter can also be used in batch mode, for running scripts. 
The name of the file containing the code to be interpreted is passed as 
argument on the command line of the interpreter:
    	 	
  ocaml hello.ml
    	 	
  Hello World

Note the difference between the previous command and the following one:
    	 	
  ocaml < hello.ml
    	 	
        Objective Caml version 3.00

  # Hello World
  - : unit = ()
  #

The latter is a “batch” interactive session where the input commands are taken 
from the file hello.ml, while the former is a script execution, where the 
commands of the file are evaluated in script mode, which turns off interactive 
messages.
