%1
max(X,Y,Z):-X>Y->Z=X;Z=Y.
max(X,Y,Z,W):-max(X,Y,P),max(P,Z,W).

%2
max_of_3(X, Y, U, Z) :- max(X, Y, M), max(M, U, Z).

%3
fact_up(0, 1).
fact_up(N, X) :- fact_up(N1, X1), N is N1 + 1, X is X1*N. 

fact_down(0, 1).
fact_down(N, X) :- N1 is N - 1, fact_down(N1, X1), X is X1*N.

%4
fib_up(1, 1).
fib_up(2, 1).
fib_up(N, X) :- N1 is N-1, N2 is N-2, fib_up(N1, X1),fib_up(N2, X2), X is X1 + X2.

fib_down(1, 1) :- !.
fib_down(2, 1) :- !.
fib_down(N, X) :- fib_down(N, X, 1, 1, 2).
fib_down(N,X,F1,F2,K):- K is N->X is F1; K1 is K+1, F3 is F1+F2, F4 is F1, fib_down(N,X,F3,F4,K1).

%7
sum_up(N, N) :- N<10.
sum_up(N,X) :- N1 is N mod 10, N2 is N div 10, sum_up(N2, X1), X is X1 + N1.

%8
sum_down(X,S):-sum_down(X,S,0).
sum_down(X,S,K):-X<10, S is K+X,!.
sum_down(X,S,K):-X>=10,X1 is X mod 10,X2 is X div 10,K1 is K+X1, sum_down(X2,S,K1).

%9
add_up(N, N) :- N<10.
add_up(N, X) :- N1 is N mod 10, N2 is N div 10, add_up(N2, X1), X is X1*N1.

%10
add_down(N, X) :- add_down(N, X, 1).
add_down(N ,X, K) :- N<10, X is K*N, !.
add_down(N, X, K) :- N >=10, N1 is N mod 10, N2 is N div 10, K1 is K*N1, add_down(N2, X, K1).

%11
max_digit_3_up(X,N) :- X<10, (   X mod 3 >0 ->  N is X; N is -1), !.
max_digit_3_up(X,N) :-  
   X1 is X div 10,
   X2 is X mod 10,
   max_digit_3_up(X1,N1),
   (  ( X2<N1, N1 mod 3>0)
   -> N is N1
   ;  X2 mod 3>0 
   		->  N is X2
   		; N is N1).

max_digit_3_down(X,N) :- max_digit_3_down(X,N,-1).
max_digit_3_down(X,N,N1) :- X<10, ( (   X>N1,  X mod 3 >0) ->  N is X; N is N1), !.
max_digit_3_down(X,N,N1) :- X>=10,
    X1 is X div 10,
   	X2 is X mod 10,
    (  ( X2>N1, X2 mod 3>0)
    -> N2 = X2 %ломается после ->
    ;   N2 = N1),
    max_digit_3_down(X1, N, N2).
    

%12
nod(A, B, GCD):-
    AmB is A mod B,
    BmA is B mod A,
    (
      AmB == 0, !, GCD is B;
      BmA == 0, !, GCD is A;

                     A > B, !, nod(AmB, B, GCD);
      nod(A, BmA, GCD)
    ).

isPr(I,I):-!.
isPr(N,D):-0>=(N mod D),!,false;
              DD is D+1, isPr(N,DD).
isPr(2):-!.
isPr(1):-!,false.
isPr(X):-isPr(X,2).

koldel(_,0,0):-!.
koldel(X,L,K):-X mod L=0 -> L1 is L-1, koldel(X,L1,K1), K=K1+1; X mod L>0->L1 is L-1, koldel(X,L1,K1), K=K1.
kol(X,Y):-koldel(X,X-1,Y).

%13

sum_dig_m_5(X,S):-sum_dig_m_5(X,S,0).
sum_dig_m_5(X,S,K):-X<10, (   X<5 ->   S is K+X; S is K),!.
sum_dig_m_5(X,S,K):-X>=10,X1 is X mod 10,X2 is X div 10,( X1<5 -> K1 is K+X1; K1 is K), sum_dig_m_5(X2,S,K1).

min_del(X, N):-min_del(X, N, 1).
min_del(X, N, K):-K+1 >= X, N is K.
min_del(X, N, K):-K<=X, X mod K is 0 -> N is K, !; K1 is K+1, min_del(X, N,K1).


sumProstU(X,K):-X<10,(isPr(X)-> K is X; K is 0), !.
sumProstU(X,K):-X>=10,X1 is X mod 10, X11 is X div 10,sumProstU(X11,K1),(isPr(X1)-> K is K1+X1; K is K1), write(K), nl.

sumProstd(X,Y):-sumProst(X,X,Y,0).
sumProst(_,0,Y,Y):-!.
sumProst(X,X1,Y,K):-X2 is X1 mod 10, X3 is X1 div 10, (isPr(X2)->K1 is K+X2; K1 is K), sumProst(X,X3,Y,K1).

