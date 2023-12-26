%a. Write a predicate to substitute an element from a list with another element in the list.
%functionA(L-list,A-pos element to be substituted,B-pos element to substitute with,pos,C-collector list,R-result)
%flowmodel(i,i,i,i,o)
%AddToEnd(L-list,E-element to be added,R-result)
%flowmodel(i,i,o)
addToEnd([],E,[E]).
addToEnd([H|T],E,R):-
    addToEnd(T,E,NewTail),
    R=[H|NewTail].

functionA([],_,_,C,C).
functionA([H|T],A,B,C,R):-
    A=:=H,
    addToEnd( C , B , NewR),
    functionA(T,A,B,NewR,R).
functionA([H|T],A,B,C,R):-
    A=\=H,
    addToEnd(C,H,NewR),
    functionA(T,A,B,NewR,R).

functionAmain(L,A,B,R):-functionA(L,A,B,[],R).
    