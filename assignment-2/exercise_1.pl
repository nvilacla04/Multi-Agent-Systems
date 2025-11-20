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
