fantasy_novel('The Lord of The Rings').
film_trilogy('The Lord of The Rings'). 
written_by(tolkein). 
fantasy_writer(tolkein).

%ture if remains uncorrupted false if corrupted
corruptionCheck(Being, one_ring) :- \+ pure_heart(Being).
safeBearer(Being, one_ring) :- corruptionCheck(Being, one_ring),\+ uses_power(Being, one_ring).
canDestroy(Being, one_ring) :- safeBearer(Being, one_ring).

%hobbits
pure_heart(frodo).
pure_heart(sam).

uses_power(gollum, one_ring).

/*
?- corruptionCheck(sam, one_ring).
true.







*/