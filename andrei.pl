%This Prolog program, delete_decreasing, aims to Delete elements from a list based on certain conditions of decreasing order.
%delete_decreasing(l1,..,ln,flag,c1,..cm,rez)
delete_decreasing([],_,[]).
delete_decreasing([A],1,[A]).
delete_decreasing([A],0,[]).
delete_decreasing([A,B|T],Flag,Rez):-
    A>B,
    NewFlag is 0,
    delete_decreasing([B|T],NewFlag,Rez).
delete_decreasing([A,B|T],Flag,Rez):-
    A<B,
    Flag=:=0,
    NewFlag is 1,
    delete_decreasing([B|T],NewFlag,Rez).
delete_decreasing([A,B|T],Flag,Rez):-
    A<B,
    Flag=:=1,
    delete_decreasing([B|T],Flag,Rez1),
    Rez=[A|Rez1].
