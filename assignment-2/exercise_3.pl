/*

Explain in at most three sentences what the below defined predicate xyz/3 does. Hint: Try
several example queries, such as xyz([1,2,3,4],A,B). or xyz(L,[a,b],[c,d])., and use tracing
to understand the recursive process and the data flow between arguments.

*/

xyz(L,A,B) :- xy(L,[],A,B).
xy([],A,A,[]).
xy([H|T],A,B,[H|R]) :- xy(T,[H|A],B,R).

/*
[trace]  ?- xyz([1,2,3,4],A,B).
   Call: (12) xyz([1, 2, 3, 4], _942, _944) ? creep
   Call: (13) xy([1, 2, 3, 4], [], _942, _944) ? creep
   Call: (14) xy([2, 3, 4], [1], _942, _3156) ? creep
   Call: (15) xy([3, 4], [2, 1], _942, _3986) ? creep
   Call: (16) xy([4], [3, 2, 1], _942, _4816) ? creep
   Call: (17) xy([], [4, 3, 2, 1], _942, _5646) ? creep
   Exit: (17) xy([], [4, 3, 2, 1], [4, 3, 2, 1], []) ? creep
   Exit: (16) xy([4], [3, 2, 1], [4, 3, 2, 1], [4]) ? creep
   Exit: (15) xy([3, 4], [2, 1], [4, 3, 2, 1], [3, 4]) ? creep
   Exit: (14) xy([2, 3, 4], [1], [4, 3, 2, 1], [2, 3, 4]) ? creep
   Exit: (13) xy([1, 2, 3, 4], [], [4, 3, 2, 1], [1, 2, 3, 4]) ? creep
   Exit: (12) xyz([1, 2, 3, 4], [4, 3, 2, 1], [1, 2, 3, 4]) ? creep
A = [4, 3, 2, 1],
B = [1, 2, 3, 4].

[trace]  ?- xyz(L,[a,b],[c,d]).
   Call: (12) xyz(_14330, [a, b], [c, d]) ? creep
   Call: (13) xy(_14330, [], [a, b], [c, d]) ? creep
   Call: (14) xy(_16524, [c], [a, b], [d]) ? creep
   Call: (15) xy(_17354, [d, c], [a, b], []) ? creep
   Fail: (15) xy(_17354, [d, c], [a, b], []) ? creep
   Fail: (14) xy(_16524, [c], [a, b], [d]) ? creep
   Fail: (13) xy(_14330, [], [a, b], [c, d]) ? creep
   Fail: (12) xyz(_14330, [a, b], [c, d]) ? creep
false.


xyz splits list L into A and B. A is reverse of L, B is L in normal order. Accumulator in helper predicate xy is used to build
the reverse list and the normal list. If I input xyz([9,8,7], A,B) its should return 

A = [7,8,9]
B = [9,8,7]

*/