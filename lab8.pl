% 1.1 Дано множество. Построить все размещения с повторениями по k элементов.

permutation(0,_,[]):-!.

permutation(K,L,[Head|Tail]):-
  K>0,
  K1 is K-1,
  pp(Head,L,_),
  permutation(K1,L,Tail).

pp(X,[X|Tail],Tail).

pp(X,[Head|Tail],[Head|Tail1]):-
  pp(X,Tail,Tail1).

% 1.2 Дано множество. Построить все перестановки.

perm(List, 0, []):-!.
perm(List, Length, [Head|Tail]):-
  member(Head, List),
  delete(List, Head, ListTail),
  NewLength is Length - 1,
  perm(ListTail, NewLength, Tail).

perm(List, Permutation):-
  length(List, Length),
  perm(List, Length, Permutation).

  % 1.3 Дано множество. Построить все размещения по k элементов.

perm_3(List, 0, []):-!.
perm_3(List, Length, [Head|Tail]):-
  pp(Head, List, _),
  delete(List, Head, ListTail),
  NewLength is Length - 1,
  perm_3(ListTail, NewLength, Tail).

  % 1.4 Дано множество. Построить все подмножества.

sub(List, Subset):-
    sub(List, [], Subset).

sub(List, Subset, Subset).

sub(List, Buf, Subset):-
    select(Element, List, Tail),
    sub(Tail, [Element|Buf], Subset).

% 1.5 Дано множество. Построить все сочетания по k элементов.

compromise(List, 0, []):-!.
compromise([Head|Tail], Length, [Head|Sublist]):-
  SublistLength is Length - 1,
  compromise(Tail, SublistLength, Sublist).

compromise([Head|Tail], Length, Sublist):-
  compromise(Tail, Length, Sublist).

% 1.6  Дано множество. Построить все сочетания с повторениями.

compromise_rep(List, 0, []):-!.

compromise_rep(List, Length, [Value|Sublist]):-
  member(Value, List),
  SublistLength is Length - 1,
  compromise_rep(List, SublistLength, Sublist).

% 2 Дано множество {a,b,c,d,e,f}. Построить все слова длины 5, в которых ровно две буквы a. Вывод в файл.

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
  permutation(5,[a,b,c,d,e,f],Res), % Получаем все размещения данного словаря длины 5
  find_count(Res, a, 2), % Отбор слов, в которых количество элементов 'a' равно 2
%  write(Res), nl, fail.
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write), fail.

% 3 Дано множество {a,b,c,d,e,f}. Построить все слова длины 5,
% в которых ровно 2 буквы a, остальные буквы не повторяются. Вывод в файл.

check_uniq([], Word).
check_uniq([a|Tail], Word):-
  check_uniq(Tail, Word).
check_uniq([Head|Tail], Word):-
  check_uniq(Tail, Word),
  find_count(Word, Head, 1).


task_3:-
  permutation(5,[a,b,c,d,e,f],Res),
  find_count(Res, a, 2),
  check_uniq(Res, Res), % Отбор слов, где все буквы, кроме 'a', уникальны, то есть встречаются 0 или 1 раз
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 4 Дано множество {a,b,c,d,e,f}. Построить все слова длины 5, в
% которых ровно одна буква повторяется 2 раза, остальные буквы не
% повторяются. Вывод в файл.

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
  find_2_count(Res, [a,b,c,d,e,f], 1), % Сверяет, чтобы количество одинаковых пар букв равнялось 1
  find_uniq_count(Res, Res, 3), % Количество уникальных букв должно равняться 3
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 5 Дано множество {a,b,c,d,e,f}. Построить все слова длины 6, в
% которых ровно 2 буквы повторяются 2 раза, остальные буквы не
% повторяются. Вывод в файл.

task_5:-
  permutation(6,[a,b,c,d,e,f],Res),
  find_2_count(Res, [a,b,c,d,e,f], 2),
  find_uniq_count(Res, Res, 2),
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 6 Дано множество {a,b,c,d,e,f}. Построить все слова длины 7, в
% которых ровно 1 буква повторяются 2 раза, ровно одна буква повторяется
% 3 раза остальные буквы не повторяются. Вывод в файл.

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

% 7 Дано множество {a,b,c,d,e,f}. Построить все слова длины 9, в
% которых ровно 2 буквы повторяются 2 раза, ровно одна буква повторяется
% три раза, остальные буквы не повторяются. Вывод в файл.

task_7:-
  permutation(9,[a,b,c,d,e,f],Res),
  find_2_count(Res, [a,b,c,d,e,f], 2),
  find_3_count(Res, [a,b,c,d,e,f], 1),
  find_uniq_count(Res, Res, 2),
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 8 Дано множество {a,b,c,d,e,f}. Построить все слова длины 4,
% в которых больше двух букв а. Вывод в файл.

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

% 9 Дано множество {a,b,c,d,e,f}. Построить все слова длины 7, в
% которых больше двух букв а. Вывод в файл.


task_9:-
  permutation(7,[a,b,c,d,e,f],Res),
  find_count(Res, a, Count),
  check_count(Count),
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).


% 10 Дано множество {a,b,c,d,e,f}. Построить все слова длины 7, в
% которых ровно 4 различных буквы. Минимизировать перебор*. Вывод в
% файл.

task_10:-
  permutation(7,[a,b,c,d,e,f],Res),
  %find_count(Res, a, Count),
  find_uniq_count(Res, Res, 4),
  open('C:/Users/User/Desktop/Учеба/4 курс/prolog_labs/8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write),
  fail.


