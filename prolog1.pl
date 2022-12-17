woman(masha).
woman(olya).
woman(anya).
woman(valya).
woman(dasha).
woman(sonya).
woman(katya).
woman(liza).
man(petya).
man(vasya).
man(misha).
man(danil).
man(yegor).
man(pasha).
man(artyom).
man(igor).
man(maxim).
man(kolya).
parent(masha, vasya).
parent(masha, valya).
parent(petya, vasya).
parent(petya, valya).
parent(petya, dasha).
parent(olya, anya).
parent(olya, misha).
parent(vasya, misha).
parent(valya, danil).
parent(valya, yegor).
parent(dasha, sonya).
parent(dasha, artyom).
parent(pasha, sonya).
parent(pasha, artyom).
parent(pasha, igor).
parent(katya, olya).
parent(maxim, olya).
parent(liza, pasha).
parent(kolya, pasha).
child(X, Y) :- parent(Y, X).
children(X) :- child(Y, X), write(Y), nl, fail.
mother(X, Y) :- woman(X), parent(X, Y).
mother(X) :- mother(Y, X), write(Y).
father(X, Y) :- man(X), parent(X, Y).
father(X) :- father(Y, X), write(Y).
brother(X, Y) :- father(F, X), father(F, Y), mother(M, X), mother(M, Y), dif(X, Y), man(X).
brothers(X) :- brother(Y, X), write(Y), nl, fail.
wife(X, Y) :- parent(X, Z), parent(Y, Z), dif(X, Y), woman(X).
wife(X) :- wife(Y, X), write(Y), nl, fail.
b_s(X, Y) :- father(F, X), father(F, Y), mother(M, X), mother(M, Y), dif(X, Y).
b_s(X) :- b_s(Y, X), write(Y), nl, fail.
grand_pa(X, Y) :- father(X, Z), parent(Z, Y).
grand_pas(X) :- grand_pa(Y, X), write(Y), nl, fail.
grand_da(X, Y) :- woman(X), parent(Y, Z), parent(Z, X).
grand_dats(X) :- grand_da(Y, X), write(Y), nl, fail.
grand_ma_and_son(X,Y) :- (   mother(X, Z), parent(Z, Y), man(Y)	); ( mother(Y, Z), parent(Z, X), man(X)  ).
nephew(X, Y) :- man(X), parent(Z, X), b_s(Z, Y).
nephews(X) :- nephew(Y, X), write(Y), nl, fail.