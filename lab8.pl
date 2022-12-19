% 1.1

permutation(0,_,[]):-!.

permutation(K,L,[Head|Tail]):-
  K>0,
  K1 is K-1,
  pp(Head,L,_),
  permutation(K1,L,Tail).

pp(X,[X|Tail],Tail).

pp(X,[Head|Tail],[Head|Tail1]):-
  pp(X,Tail,Tail1).

% 1.2

perm(List, 0, []):-!.
perm(List, Length, [Head|Tail]):-
  member(Head, List),
  delete(List, Head, ListTail),
  NewLength is Length - 1,
  perm(ListTail, NewLength, Tail).

perm(List, Permutation):-
  length(List, Length),
  perm(List, Length, Permutation).

  % 1.3

perm_3(List, 0, []):-!.
perm_3(List, Length, [Head|Tail]):-
  pp(Head, List, _),
  delete(List, Head, ListTail),
  NewLength is Length - 1,
  perm_3(ListTail, NewLength, Tail).

  % 1.4

sub(List, Subset):-
    sub(List, [], Subset).

sub(List, Subset, Subset).

sub(List, Buf, Subset):-
    select(Element, List, Tail),
    sub(Tail, [Element|Buf], Subset).

% 1.5 

compromise(List, 0, []):-!.
compromise([Head|Tail], Length, [Head|Sublist]):-
  SublistLength is Length - 1,
  compromise(Tail, SublistLength, Sublist).

compromise([Head|Tail], Length, Sublist):-
  compromise(Tail, Length, Sublist).

% 1.6

compromise_rep(List, 0, []):-!.

compromise_rep(List, Length, [Value|Sublist]):-
  member(Value, List),
  SublistLength is Length - 1,
  compromise_rep(List, SublistLength, Sublist).

% 2 Äàíî ìíîæåñòâî {a,b,c,d,e,f}. Ïîñòðîèòü âñå ñëîâà äëèíû 5, â êîòîðûõ ðîâíî äâå áóêâû a. Âûâîä â ôàéë.

is_equal(X,Y):- X = Y.

set_count(Head, Char, PrevCount, Count):-
  is_equal(Head, Char) ->
    Count is PrevCount + 1;
    Count is PrevCount.

find_count([], Char, 0).
find_count([Head|Tail], Char, Count):-
  find_count(Tail, Char, PrevCount),
  set_count(Head, Char, PrevCount, Count).

task_2:-
  permutation(5,[a,b,c,d,e,f],Res), % Ïîëó÷àåì âñå ðàçìåùåíèÿ äàííîãî ñëîâàðÿ äëèíû 5
  find_count(Res, a, 2), % Îòáîð ñëîâ, â êîòîðûõ êîëè÷åñòâî ýëåìåíòîâ 'a' ðàâíî 2
%  write(Res), nl, fail.
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write), fail.

% 3 Äàíî ìíîæåñòâî {a,b,c,d,e,f}. Ïîñòðîèòü âñå ñëîâà äëèíû 5,
% â êîòîðûõ ðîâíî 2 áóêâû a, îñòàëüíûå áóêâû íå ïîâòîðÿþòñÿ. Âûâîä â ôàéë.

check_uniq([], Word).
check_uniq([a|Tail], Word):-
  check_uniq(Tail, Word).
check_uniq([Head|Tail], Word):-
  check_uniq(Tail, Word),
  find_count(Word, Head, 1).


task_3:-
  permutation(5,[a,b,c,d,e,f],Res),
  find_count(Res, a, 2),
  check_uniq(Res, Res), % Îòáîð ñëîâ, ãäå âñå áóêâû, êðîìå 'a', óíèêàëüíû, òî åñòü âñòðå÷àþòñÿ 0 èëè 1 ðàç
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 4 Äàíî ìíîæåñòâî {a,b,c,d,e,f}. Ïîñòðîèòü âñå ñëîâà äëèíû 5, â
% êîòîðûõ ðîâíî îäíà áóêâà ïîâòîðÿåòñÿ 2 ðàçà, îñòàëüíûå áóêâû íå
% ïîâòîðÿþòñÿ. Âûâîä â ôàéë.

find_uniq_count(Word, [], 0).

find_uniq_count(Word, [Head|Tail], Count):-
  find_uniq_count(Word, Tail, PrevCount),
  find_count(Word, Head, CharCount),
  set_count_3(CharCount, PrevCount, Count).

set_count_3(CharCount, PrevCount, Count):-
  CharCount =:= 1 ->
    Count is PrevCount + 1;
    Count is PrevCount.

set_count_2(CharCount, PrevCount, Count):-
  CharCount =:= 2 ->
    Count is PrevCount + 1;
    Count is PrevCount.

find_2_count(Word, [], 0).

find_2_count(Word, [Head|Tail], Count):-
  find_2_count(Word, Tail, PrevCount),
  find_count(Word, Head, CharCount),
  set_count_2(CharCount, PrevCount, Count).


task_4:-
  permutation(5,[a,b,c,d,e,f],Res),
  find_2_count(Res, [a,b,c,d,e,f], 1), % Ñâåðÿåò, ÷òîáû êîëè÷åñòâî îäèíàêîâûõ ïàð áóêâ ðàâíÿëîñü 1
  find_uniq_count(Res, Res, 3), % Êîëè÷åñòâî óíèêàëüíûõ áóêâ äîëæíî ðàâíÿòüñÿ 3
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 5 Äàíî ìíîæåñòâî {a,b,c,d,e,f}. Ïîñòðîèòü âñå ñëîâà äëèíû 6, â
% êîòîðûõ ðîâíî 2 áóêâû ïîâòîðÿþòñÿ 2 ðàçà, îñòàëüíûå áóêâû íå
% ïîâòîðÿþòñÿ. Âûâîä â ôàéë.

task_5:-
  permutation(6,[a,b,c,d,e,f],Res),
  find_2_count(Res, [a,b,c,d,e,f], 2),
  find_uniq_count(Res, Res, 2),
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 6 Äàíî ìíîæåñòâî {a,b,c,d,e,f}. Ïîñòðîèòü âñå ñëîâà äëèíû 7, â
% êîòîðûõ ðîâíî 1 áóêâà ïîâòîðÿþòñÿ 2 ðàçà, ðîâíî îäíà áóêâà ïîâòîðÿåòñÿ
% 3 ðàçà îñòàëüíûå áóêâû íå ïîâòîðÿþòñÿ. Âûâîä â ôàéë.

set_count_4(CharCount, PrevCount, Count):-
  CharCount =:= 3 ->
    Count is PrevCount + 1;
    Count is PrevCount.

find_3_count(Word, [], 0).

find_3_count(Word, [Head|Tail], Count):-
  find_3_count(Word, Tail, PrevCount),
  find_count(Word, Head, CharCount),
  set_count_4(CharCount, PrevCount, Count).

task_6:-
  permutation(7,[a,b,c,d,e,f],Res),
  find_2_count(Res, [a,b,c,d,e,f], 1),
  find_3_count(Res, [a,b,c,d,e,f], 1),
  find_uniq_count(Res, Res, 2),
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 7 Äàíî ìíîæåñòâî {a,b,c,d,e,f}. Ïîñòðîèòü âñå ñëîâà äëèíû 9, â
% êîòîðûõ ðîâíî 2 áóêâû ïîâòîðÿþòñÿ 2 ðàçà, ðîâíî îäíà áóêâà ïîâòîðÿåòñÿ
% òðè ðàçà, îñòàëüíûå áóêâû íå ïîâòîðÿþòñÿ. Âûâîä â ôàéë.

task_7:-
  permutation(9,[a,b,c,d,e,f],Res),
  find_2_count(Res, [a,b,c,d,e,f], 2),
  find_3_count(Res, [a,b,c,d,e,f], 1),
  find_uniq_count(Res, Res, 2),
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 8 Äàíî ìíîæåñòâî {a,b,c,d,e,f}. Ïîñòðîèòü âñå ñëîâà äëèíû 4,
% â êîòîðûõ áîëüøå äâóõ áóêâ à. Âûâîä â ôàéë.

check_count(Count):-
  Count > 2.

task_8:-
  permutation(4,[a,b,c,d,e,f],Res),
  find_count(Res, a, Count),
  check_count(Count),
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 9 Äàíî ìíîæåñòâî {a,b,c,d,e,f}. Ïîñòðîèòü âñå ñëîâà äëèíû 7, â
% êîòîðûõ áîëüøå äâóõ áóêâ à. Âûâîä â ôàéë.


task_9:-
  permutation(7,[a,b,c,d,e,f],Res),
  find_count(Res, a, Count),
  check_count(Count),
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).


% 10 Äàíî ìíîæåñòâî {a,b,c,d,e,f}. Ïîñòðîèòü âñå ñëîâà äëèíû 7, â
% êîòîðûõ ðîâíî 4 ðàçëè÷íûõ áóêâû. Ìèíèìèçèðîâàòü ïåðåáîð*. Âûâîä â
% ôàéë.

task_10:-
  permutation(7,[a,b,c,d,e,f],Res),
  %find_count(Res, a, Count),
  find_uniq_count(Res, Res, 4),
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write),
  fail.


