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
 
