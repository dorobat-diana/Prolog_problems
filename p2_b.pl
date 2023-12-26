%b. For a heterogeneous list, formed from integer numbers and list of numbers, write a predicate to sort every 
%sublist, keeping the doubles.
%Eg.: [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
%[1, 2, [1, 4, 4], 3, 6, [1, 3, 7, 9, 10], 5, [1, 1, 1], 7].
insert_pos([],E,[E]).
insert_pos([H|T],E,R):-
    E=<H,
    R=[E,H|T].
insert_pos([H|T],E,R):-
    E>H,
    insert_pos(T,E,NEWR),
    R = [H|NEWR].
sort_double([],C,C).
sort_double([H|T],C,R):-
    insert_pos(C,H,NEWC),
    sort_double(T,NEWC,R).
%sort_double_main(L,R)=sort_double(l,[],R)
sort_double_main(L,R):-sort_double(L,[],R).
%AddToEnd(L-list,E-element to be added,R-result)
%flowmodel(i,i,o)
addToEnd([],E,[E]).
addToEnd([H|T],E,R):-
    addToEnd(T,E,NewTail),
    R=[H|NewTail].
%hetero_sort(L,C,R)->L-list,C-collector,R-result
hetero_sort([],C,C).
hetero_sort([H|T],C,R):-
    H=[H1|_],!,
    sort_double_main(H,NEWH),
    addToEnd(C,NEWH,NEWC),
    hetero_sort(T,NEWC,R).
hetero_sort([H|T],C,R):-
    addToEnd(C,H,NEWC),
    hetero_sort(T,NEWC,R).
hetero_sort_main(L,R):-hetero_sort(L,[],R).