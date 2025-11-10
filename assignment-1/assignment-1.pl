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



# Exercise 3

Indicate which of the pairs unify and, if they unify, give the variable instantiations that lead to successful unification.

  

1) 

```

ring = power.

```

Both ring and power are atoms that are not the same so they will not unify.

2) 

```

power = Ring.

```

Can unify since Ring is a variable that can unify to a atom.

3) 

```

key(X,'value') = key(data,X).

```

Will not unify as though the arity does match the values do not. requires X = data and X = 'value' which implies data = 'value' which is false since they are distinct atoms.

4) 

```

triple(X,item(Y),Z) = triple(a,item(b),c).

```

Yes they will unify. The functors and arity match the variables can be bound to X = a, Y = b and Z = c.

5) 

```

structure(X,layer(Y),depth(Z)) = structure(layer(a),layer(b),depth(c)).

```

Will unify with X = layer(a) and Y = b and Z = c.

6) 

```

X = 3 + 4.

```

Will unify. Binds X to the unevaluated term 3+4.

7) 

```

Y is 3 + 4.

```

From slides: "The is operator takes an arithmetic expression on its right side, evaluates it, and unifies the result with the variable on its left side." 
Y=7.

8) 

```

7 =:= 3+4.

```

=:= is a arithmetic comparison so it will not unify. But will succeed. 

9) 

```

7 =\= 2*3.

```

Does not unify as =\= is a arithmetic comparison. But will succeed. 


10) 

```

Z is 5*2,Z=:=10.

```

Will not unify. =:= is a arithmetic comparison that does not bind. But will succeed. 


11) 

```

\+(5=6).

```

5=6 fails to unify and \+ succeeds when the argument fails. But will succeed. 


12) 

```

C is (7-2), C=:=5.

```

No unification occurs. Binds C = 5 then C =:= 5 checks for equality. But will succeed. 


/*
Exercise 4


1. The call of same_spieces(dog,A) will fail because
all of the clause that appear in the KB, and might be accesed by the call of same_spieces(dog,A),
consist of the not(X=Y).
After binding the dog = X and A = Y we have not(dog=A), where A is uninstantiated variable and dog is an instance.
Therefroe dog=A is valid, however not(sth) evaluates to true only if sth = false, thus in this case not(dog=A)
will evaluate to false. The same case happens in the last clause where not(X=Y) is chekced again.


2. 
mammal( dog ).
mammal( cat ).
bird( eagle ).
bird( parrot ).
same_species(X ,Y ) :- mammal(X), mammal(Y), not(X=Y)
same_species(X , Y ) :- bird(X), bird(Y), not(X=Y)

If we change our KB to the one proivded above, query like same_spieces(dog, A) will succeed.
That is the case since after the call, X binds to the dog, and Y binds to the A 
Our KB further start looking for mammal(dog) and it finds one (making it true), and then 
start looking for mammal(A) finds mammal(dog) so binds A with dog (making it true as well).
Then it checks not(X=Y), since in our case we have dog = doge it makes this rule false.
It backtracks to the mammal(A) and checks if there is any other instance that might satisty this rule.
It finds mammal(cat) and it binds it with A (makes it true), then it proceeds to the last rule
where X has to be different from Y - if Y = cat, and X = dog that is the case, and it makes that rule true.

3. 

some_spieces(dog,A)
|
X = dog, Y = A -------------------------------------------
|                                                        |
mammal(dog)                                             bird(dog)
|                                                         |
succeed                                                  fail
|
mammal(A)-------------
|                    |
A=dog                A = cat
|                    |
mammal(dog)          mammal(cat)
|                    |
succeed              succeed
|                    |
not(dog,dog)         not(dog,cat)
|                    |
Fail                 succeed

4.  
mammal( dog ).
mammal( cat ).
bird( eagle ).
bird( parrot ).
same_species(X ,Y ) :- mammal(X), mammal(Y), not(X=Y)
same_species(X , Y ) :- bird(X), bird(Y), not(X=Y)

This KB wil improve the performance of the cals such as same_species(X,Y). 
This is the fact since it doesnt' immedietly fails by checking the not(X=Y) (as it happended with the intial KB)
With the updated KB and with the intial call same_species(dog,A) it first, bounds X = dog and then Y = A
it then checks if the mammal(dog) exsits in our KB - it does. then it check if mammal(A) exists.
The first that occurs is when A = dog, thus this evaluates to true as well. Finally it checks 
not(X=Y) which in our case is (dog = dog)  = True but not(True) = False thus it backtracks to the 
previous step and checks the if there is any other value that could boudn to A and satisfy mammal(sth).
There is a value cat, it bounds to A = cat, we have mammal(cat) = true , and then not(dog=cat) = true 


*/

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




 
/*
exercise 6
*/


/*
6.1
warm(Y):-warm(Y).
warm(a).
happy(b).
summer(X):-happy(X).
summer(X):-warm(Y).
*/


/*
explanation
if we place the clauses in the way given above (3,4,5,1,2)
and query our KB by summer(a) then after wfinidng a first fitting clause
4th from the top, X binds to a and it is true iff happy(a) exist in our KB -it doesnt thus
it evalautes to false and look for the other rule.
It finds rule nr 5 (strating from the top) which binds X with a and states that this is true if 
warm(Y) is true . It looks for this kind of infromation in our KB and finds the frist one
warm(Y) is true if warm(Y) is true, which leads to an infinfe loop cuz it kept looking for this 
variable Y that might make warm(Y) true. 
*/


/*
exercise 6.2
*/

/*

summer(X) :- happy(X).
summer(X) :- warm(Y).
warm(a).
warm(Y) :- warm(Y).
happy(b).

after calling summer(a), prolog first checks summer(X):- happy(X) -> whihc fails
since happy(a) is false
then it tires the secodn rulle summer(X) :- warm(Y) ,it finds warm(a) and gives true
but iot hcekc other options as well and it finds 
warmy(Y):- warm(Y), this causes infiite recursion
prolog keeps calling warm(Y)
*/








