
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