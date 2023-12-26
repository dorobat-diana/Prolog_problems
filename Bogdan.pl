%the union of two lists
%union(L1-list one,L2-list two,R)
%flowmodel(i,i,o)
union(L1,[],L1).
union(L1,[H|T],R):-
    \+member(H,L1),
    NewL=[H|L1],
    union(NewL,T,R).
union(L1,[H|T],R):-
    member(H,L1),
    !,
    union(L1,T,R).

