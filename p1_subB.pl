%b. Write a predicate to create the sublist (lm, …, ln) from the list (l1,…, lk).
%functionb(L-list,M-posM,N-posN,P-current pos,C-collector list,R-result)
%flowmodel(i,i,i,i,i,o)
%AddToEnd(L-list,E-element to be added,R-result)
%flowmodel(i,i,o)
addToEnd([],E,[E]).
addToEnd([H|T],E,R):-
    addToEnd(T,E,NewTail),
    R=[H|NewTail].
functionB([],_,_,_,C,C).
functionB([H|T],M,N,P,C,R):-
    P>=M,
    P=<N,
    NewP is P+1,
    addToEnd(C,H,NewC),
    functionB(T,M,N,NewP,NewC,R).
functionB([_|T],M,N,P,C,R):-
    P<M,
    NewP is P+1,
    functionB(T,M,N,NewP,C,R).
functionB([_|T],M,N,P,C,R):-
    P>N,
    NewP is P+1,
    functionB(T,M,N,NewP,C,R).
functionBmain(L,M,N,R):-functionB(L,M,N,1,[],R).