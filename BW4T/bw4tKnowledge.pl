% declarations of predicates used but not defined here.
:- dynamic
	in/1,		% percept predicate that informs where the robot is. 
	state/1,	% percept predicate to keep track of whether a robot is moving.
	visited/1,	% predicate to keep track of the rooms that have been visited.
	zone/5,		% percept predicate with information about all zones in BW4T.
	%added precepts 
	sequence/1,			%percept: goal sequence
	sequenceIndex/1,	%percept: progress in goal sequence
	atBlock/1,			%percept: block is in reach (precondition for pickUp)
	color/2,			%percept: block color
	holding/1,			%percept: what the robot is holding
	block/3,			%memory: block(BlockID, ColorID, PlaceID)
	target/1. 			


% A room is a place with exactly one neighbour; in other words, there is only one way to
% get to and from that place.
room(PlaceID) :- zone(_, PlaceID, _, _, Neighbours), length(Neighbours, 1).

% The dropzone is the zone with type dropzone.
dropzone(PlaceID) :- zone(dropzone, PlaceID, _, _, _).

% A room has not yet been visited if the robot has not yet been there.
not_yet_visited(PlaceID) :- room(PlaceID), not( visited(PlaceID) ).

%the next color that should be delivered to the dropzone. 
next_color_needed(ColorID) :-
    sequence(Seq),
    sequenceIndex(I),
    nth0(I, Seq, ColorID).



