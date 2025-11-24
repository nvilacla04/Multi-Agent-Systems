/*exercise 1 */

% KB - direct connections between buildings 

bike(library, cafeteria, 3).
bike(cafeteria, main_gate, 2).
bike(lab_building, library, 4).

walk(main_gate, admin_office, 5).
walk(library,lecture_hall, 6).
walk(lecture_hall, lab_building, 7).

%Ex 1 base case direct bike connection

route_by_bike(F, T) :- bike(F, T, _).

%reurse 

route_by_bike(F, T) :- bike(F, Intermediate, _), route_by_bike(Intermediate, T).

/* Ex 2 Define a predicate route/2 such that route(F, T) succeeds if it is possible to reach T from F
either by bike or by walking (possibly combining both). */

route(F, T) :- bike(F, T, _).
route(F, T) :- walk(F, T, _).

%recursive case

route(F, T) :- bike(F, Intermediate, _), route(Intermediate, T).
route(F, T) :- walk(F, Intermediate, _),route(Intermediate, T).

/* Ex 3.
Extend the predicate to route/3 such that route(F, T, M) succeeds if there is a route from
F to T (mixing walking and biking) and M is the total time in minutes. Hint: You can sum
the minutes of subroutes using arithmetic after the recursive call. You do not need to use
accumulators.
*/

%base case
route(F, T, M) :- bike(F, T, M).
route(F, T, M) :- walk(F, T, M).

%recursive casea
route(F, T, M) :- bike(F, Intermediate, M1), route(Intermediate, T, M2), M is M1 + M2.
route(F, T, M) :- walk(F, Intermediate, M1), route(Intermediate, T, M2), M is M1 + M2.


/* exercise 2 */

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

exactlyThreeTower(X) :-
    tower(TowerList),
    TowerList = [X|_],
    length(TowerList, 3).


/* exercise_3 */

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

/* exercise 4 */
sum_of_squares_equal(B, C) :-
    sumsq(B, SumB),
    sumsq(C, SumC),
    SumB =:= SumC.

balance(A, B, C) :-
    permutation(A, BC),
    append(B, C, BC),
    sum_of_squares_equal(B, C).

sumsq([], 0).
sumsq([H|T], S) :- sumsq(T, R), S is R + H*H.

*/

/*exercise_5  */


/*code workflow */
/* midrange/2 first initializes the min value and max value with the first element of the list
, then at each recursive step - helper comapres curretn element with the running 
min value and max value, so that:
- if the element is smalle -> update the minimum
- if the element is larger -> it updates the maximum 
As soon as the enitre list is processed , prolog checsk the base case 
and comptues the midrange */
midrange([H|T], M) :-
    midrange_helper(T, H, H, M).

midrange_helper([], Min, Max, M) :-
    M is (Min + Max) // 2.

midrange_helper([H|T], Min_before, Max_before, M) :-
    ( H < Min_before -> Min_after = H ; Min_after = Min_before),
    ( H > Max_before -> Max_after= H ; Max_after = Max_before ),
    midrange_helper(T, Min_before, Max_before, M).


/* exercise 6*/
%template

/*
album(
    'Album Title',
    [artist('Lastname', 'Firstname'), artist('Lastname2', 'Firstname2')],
    [genre('rock'), genre('pop')],
    num tracks in album,
    total duration in minutes,
    rating from 1 to 10
).
*/ 

album(
   "Abbey Road",
   [artist("Lennon","John"),artist("McCartney","Paul")],
   [genre("rock")],
   17,
   47,
   10
   ).

album(
   "Thriller",
   [artist("Jackson","Michael")],[genre("pop"),genre("funk")],9,42,9).
album(
   "Random Access Memories",
   [artist("Daft","Guy-Manuel"),artist("Daft","Thomas")],
   [genre("electronic")],
   13,
   74,
   8)
   .

album(
   "The Dark Side of the Moon",
   [artist("Waters","Roger"),artist("Gilmour","David")],
   [genre("progressive rock")],
   10,
   43,
   10
   ).

%1 (5 pts) Write a predicate allAlbumTitles/1 such that allAlbumTitles(L) succeeds if L contains all album titles.

allAlbumTitles(L) :- findall(Title, album(Title,_,_,_,_,_), L).

/*
?- allAlbumTitles(["Abbey Road", "Thriller", "Random Access Memories", "The Dark Side of the Moon"]).
true.
*/

%2 (5 pts) Write a predicate allAlbumTitlesSorted/1 which returns an alphabetically sorted list of album titles.

allAlbumTitlesSorted(L) :- allAlbumTitles(Titles), sort(Titles, L).

%3 (8 pts) Write a predicate albumsByGenre/2 such that albumsByGenre(genre(’rock’),L) returns all album titles in that genre.
 
