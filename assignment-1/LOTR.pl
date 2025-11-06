fantasy_novel('The Lord of The Rings').
film_trilogy('The Lord of The Rings'). 
written_by(tolkein). 
fantasy_writer(tolkein).

%ture if remains uncorrupted false if corrupted
corruptionCheck(Being, one_ring) :- \+ pure_heart(Being).
safeBearer(Being, one_ring) :- corruptionCheck(Being, one_ring),\+ uses_power(Being, one_ring).
canDestroy(Being, one_ring) :- safeBearer(Being, one_ring).

%hobbits of pure heart
pure_heart(frodo).
pure_heart(sam).
pure_heart(tom).

%gollum as also a hobbit but with no pure heart both use the ring
uses_power(gollum, one_ring).
uses_power(frodo, one_ring).


/*
1. All 3 queryable

?- corruptionCheck(sam, one_ring).
true.

?- safeBearer(sam, one_ring).
true.

?- canDestroy(sam,one_ring).
true.

2. Query that returns false for each rule

?- corruptionCheck(gollum,one_ring).
false.

?- safeBearer(gollum,one_ring).
false.

?- canDestroy(gollum,one_ring).
false.
*/

ring = power.
power = Ring.
key(X,'value') = key(data,X).
triple(X,item(Y),Z) = triple(a,item(b),c)
structure(X,layer(Y),depth(Z)) = structure(layer(a),layer(b),depth(c)).
X = 3 + 4.
Y is 3 + 4.
7 =:= 3 + 4.
7 =\= 2 * 3.
Z is 5 * 2, Z =:= 10.
\+ (5 = 6).
C is (7 - 2), C =:= 5.

/*
Exercise 3 - Unification


*/




