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
