%a. Sort a list with keeping double values in resulted list. E.g.: [4 2 6 2 3 4] --> [2 2 3 4 4 6]
%sort_double(L,C,R)->L-list,R-result,C-Collector
%flow (i,i,o)
%insert_pos(L,E,R)->L-list,R-resul,E-element to be inserted on corresponding pos
%flow(i,i,0)
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
