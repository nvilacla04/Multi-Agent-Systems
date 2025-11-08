/*Write Prolog facts and rules that succeed through simple pattern matching. All goals must be
provable through unification alone.*/

/* Exercise5.1
1. Define a predicate first_two(List, X, Y) that succeeds when X and Y are the first two
elements of List. Example query: ?- first_two([a,b,c,d], X, Y). [4 pts]
*/

first_two([X,Y| _],X,Y) . 

/*
?- first_two([a,b,c,d], X, Y).
X = a,
Y = b.
*/



/* Exercise5.2
2. Define a predicate last_two(List, X, Y) that succeeds when X and Y are the last two elements
of a list of exactly four elements. Example query: ?- last_two([a,b,c,d], X, Y). [4 pts]
*/
last_two([_,_,X,Y], X,Y).


/*
?- last_two([a,b,c,d], X, Y).
X = c,
Y = d.
*/


/* Exercise 5.3
3. Define a predicate split_string(StringList, Prefix, Suffix) that succeeds when StringList
is composed of two sublists, the first of length two (Prefix) and the rest (Suffix). Example
query: ?- split_string([h,e,l,l,o], P, S). [4 pts]
*/

split_string([A,B|_], [A,B], _).


/*
?- split_string([h,e,l,l,o], P, S).
P = [h, e].
*/

/* Exercise 5.4
4. Define a predicate swap_pair(Pair, Swapped) that succeeds when Pair is a list of exactly two
elements and Swapped is that list with the order reversed. Example query: ?- swap_pair([x,y],
Z). [4 pts]
*/

swap_pair([X,Y], [Y,X]).

/*
?- swap_pair([x,y], Z).
Z = [y, x].
*/



