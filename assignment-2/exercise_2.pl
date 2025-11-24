/* 2nd exercise kb */

on(b, a).
on(c, b).
on(a, d). /* needed for 2nd, 3rd point of the exercises, helping predicate <- just to see if it works */ 
above(X, Y) :- on(X, Y).
above(X, Y) :- on(X, Z), above(Z, Y).


/* 1  */

/* above(c,a) */ 
/* above(b,a) */ 
/* above(c,b) */ 


/* 2 */

atLeastThree(X):- on(X,Y), on(Y,Z), on(Z,G).


/* 3 */

atLeastThree_2(X) :-
    setof(Y, above(X, Y), AboveList),
    length(AboveList, L),
    L >= 3.


/* 4*/

on(a,b).
on(b,c).
on(c,d).
on(d,e).
on(e,table).
tower([X]) :- on(X,table).
tower([X,Y|T]) :- on(X,Y), tower([Y|T]).

exactlyThreeTower(X) :- , length()