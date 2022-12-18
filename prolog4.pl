%1
read_list([H|T]) :- readln(H), H =\= 0, !, read_list(T).
read_list([]).

write_list([Head|Tail]) :- write(Head), write(" "),
    write_list(Tail).
write_list([]) :- !.

%2
sum_list_down([H|T],X):- sum_list_down([H|T],X,0).
sum_list_down([],X,X).
sum_list_down([H|T],X,Sum):-Sum1 is Sum + H , sum_list_down(T, X, Sum1).

%3
sum_list_up([],0).
sum_list_up([H|T],Sum):- sum_list_down(T, Sum1),Sum is H + Sum1.

%4
list_el_numb([X|_],X,1):- !.
list_el_numb([_|Y],X,N):- list_el_numb(Y,X,N1), N is N1+1, !;
	write("Некорректная запись"), !.
%5
match([X|_],1,X) :- !.
match([_|Y],N,X) :- N > 1, N1 is N-1, match(Y,N1,X), !;
    write("Некорректная запись"), !.

%6
min_list_up([Min],Min):- !.
min_list_up([H,K|T],Min) :- H =< K, min_list_up([H|T],Min), !.
min_list_up([H,K|T],Min) :- H > K, min_list_up([K|T],Min), !.

%8
min(Min):- read_list(L), write_list(L), min_list_up(L,Min).

%9
is_member(X,[X|_]):- !.
is_member(X,[_|Y]):- is_member(X,Y).

%10
con([],L,L).
con([X|L1],L2,[X|L3]):- con(L1,L2,L3).

turn([],[]).
turn([H|T],L):- turn(T,Z), con(Z,[H],L).

%11
sim([],_).
sim([X|L],[X|M]):- sim(L,M).

p([X|L],[X|M]):- sim(L,M), !.
p(L,[_|M]):- p(L,M).

%12
del_num(_,[],[]).
del_num([_|T],1,T):- !.
del_num([H|T],I,[H|NewT]):- I1 is I-1, del_num(T,I1,NewT).

%13
del_el(_,[],[]).
del_el(X,[X|L],M):- !, del_el(X,L,M).
del_el(X,[Y|L1],[Y|L2]):- del_el(X,L1,L2), !.

%14
unique([]):- !.
unique([H|T]):- counter(T,H,N), N < 1, unique(T), !; fail.

%15
del_doubles([],[]).
del_doubles([X|S1],S2):- is_member(X,S1), !, del_doubles(S1,S2).
del_doubles([X|S1],[X|S2]):- del_doubles(S1,S2).

%16
counter([],_,0):- !.
counter([H|T],H,N) :- counter(T,H,N1), N is N1+1, !.
counter([X|T],H,N) :- X =\= H, counter(T,H,N), !.

%17
len([], 0):- !.
len([_|T], Z):- len(T,Z1), Z is Z1+1.
