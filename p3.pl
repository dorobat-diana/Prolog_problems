%3. Write a predicate to determine all decomposition of n (n given, positive), as sum of consecutive natural 
%numbers.
%sum(L-list,S-suma) flowmodel(i,o)
sum([],0).
sum([H|T],S):-
    sum(T,R),
    S is R+H.
%ifsum(L,S). flowmodel(i,i)
ifsum([H|T],S):-
    sum([H|T],R),
    R=:=S.
%decomposition(n,In,curr,C,R){ R ,if n=0
%				R ,if curr>n
%				curr+decomposition(n-1,In,curr+1,C,R) ,if n>0 and sum(C)<n
%				decomposition(n,In,curr+1,C,R) ,if n=IN and sum(C)<n}
%flowmodel(i,i,o)
decomposition(_,_,R,R).
decomposition(N,Curr,C,R):-
    N>0,
    sum(C,S),
    S<N,
    NewN is N-1,
    NewCurr is Curr+1,
    NewC=[Curr|C],
    decomposition(NewN,NewCurr,NewC,R).
decomposition(N,Curr,[],R):-
    N>0,
    Curr<N,
    NewCurr is Curr+1,
    decomposition(N,NewCurr,[],R).  
%condition(N,NR)flowmodel(i,o)
%condition(N,NR){R ,if decomposition(N,1,[],R),sum(R,S),S=N
                %nothing ,otherwise}
condition(N,NR):-
    decomposition(N,1,[],R),
    sum(R,S),
    S=:=N,
    NR=R.
%main(N,Results)flowmodel(i,o)
main(N,Results):-
findall(R,condition(N,R),Results).
        