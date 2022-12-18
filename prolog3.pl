max(X, Y, X)- X  Y, !.
max(_, Y, Y).

max_of_3(X, Y, U, Z) - max(X, Y, M), max(M, U, Z).

fact_up(0, 1).
fact_up(N, X) - fact_up(N1, X1), N is N1 + 1, X is X1  N. 

fact_down(0, 1).
fact_down(N, X) - N1 is N - 1, fact_down(N1, X1), X is X1  N.

fib_up(1, 1).
fib_up(2, 1).
fib_up(N, X) - N1 is N-1, N2 is N-2, fib_up(N1, X1),fib_up(N2, X2), X is X1 + X2.

fib_down(1, 1) - !.
fib_down(2, 1) - !.
fib_down(N, X) - fib_down(N, X, 1, 1, 2).
fib_down(N, X, F1, F2, K) - K is N - X is F1;
    K1 is K + 1, F3 is F1 + F2, F4 is F1, fib_down(N, X, F3, F4, K1).

%7
sum_up(N, N) - N  10.
sum_up(N,X) - N1 is N mod 10, N2 is N div 10, sum_up(N2, X1), X is X1 + N1.

%8
sum_down(N, X) - sum_down(N, X, 0).
sum_down(N ,X, K) - N  10, X is K + N, !.
sum_down(N, X, K) - N = 10, N1 is N mod 10, N2 is N div 10, K1 is K + N1, sum_down(N2, X, K1).

%9
add_up(N, N) - N  10.
add_up(N, X) - N1 is N mod 10, N2 is N div 10, add_up(N2, X1), X is X1  N1.

%10
add_down(N, X) - add_down(N, X, 1).
add_down(N ,X, K) - N  10, X is K  N, !.
add_down(N, X, K) - N = 10, N1 is N mod 10, N2 is N div 10, K1 is K  N1, add_down(N2, X, K1).

%11
kol_three_up(N, X):- N==0, X is 0; X1 is N mod 10, N1 is N div 10, X3 is X1 mod 3, X3 > 0, kol_three_up(N1, X2), X1>X2, X is X1, !;
    X1 is N mod 10, N1 is N div 10, X3 is X1 mod 3, X3 > 0, kol_three_up(N1, X2), X1=<X2, X is X2, !;
    X1 is N mod 10, N1 is N div 10, X3 is X1 mod 3, X3 == 0, kol_three_up(N1, X2), X is X2, !.

%12
nod(A, B, GCD) -
    AmB is A mod B,
    BmA is B mod A,
    (
      AmB == 0, !, GCD is B;
      BmA == 0, !, GCD is A;

                     A  B, !, nod(AmB, B, GCD);
      nod(A, BmA, GCD)
    ).

is_pr(I,I) - !.
is_pr(N,D) - 0 = (N mod D), !, false;
              DD is D + 1, is_pr(N, DD).
is_pr(2) - !.
is_pr(1) - !, false.
is_pr(X) - is_pr(X, 2).


koldel(_,0,0)-!.
koldel(X,L,K)-X mod L=0 - L1 is L-1, koldel(X,L1,K1), K=K1+1; X mod L0-L1 is L-1, koldel(X,L1,K1), K=K1.
kol(X,Y)-koldel(X,X-1,Y).
