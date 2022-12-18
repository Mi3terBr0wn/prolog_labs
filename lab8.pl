% 1.1 ���� ���������. ��������� ��� ���������� � ������������ �� k ���������.

permutation(0,_,[]):-!.

permutation(K,L,[Head|Tail]):-
  K>0,
  K1 is K-1,
  pp(Head,L,_),
  permutation(K1,L,Tail).

pp(X,[X|Tail],Tail).

pp(X,[Head|Tail],[Head|Tail1]):-
  pp(X,Tail,Tail1).

% 1.2 ���� ���������. ��������� ��� ������������.

perm(List, 0, []):-!.
perm(List, Length, [Head|Tail]):-
  member(Head, List),
  delete(List, Head, ListTail),
  NewLength is Length - 1,
  perm(ListTail, NewLength, Tail).

perm(List, Permutation):-
  length(List, Length),
  perm(List, Length, Permutation).

  % 1.3 ���� ���������. ��������� ��� ���������� �� k ���������.

perm_3(List, 0, []):-!.
perm_3(List, Length, [Head|Tail]):-
  pp(Head, List, _),
  delete(List, Head, ListTail),
  NewLength is Length - 1,
  perm_3(ListTail, NewLength, Tail).

  % 1.4 ���� ���������. ��������� ��� ������������.

sub(List, Subset):-
    sub(List, [], Subset).

sub(List, Subset, Subset).

sub(List, Buf, Subset):-
    select(Element, List, Tail),
    sub(Tail, [Element|Buf], Subset).

% 1.5 ���� ���������. ��������� ��� ��������� �� k ���������.

compromise(List, 0, []):-!.
compromise([Head|Tail], Length, [Head|Sublist]):-
  SublistLength is Length - 1,
  compromise(Tail, SublistLength, Sublist).

compromise([Head|Tail], Length, Sublist):-
  compromise(Tail, Length, Sublist).

% 1.6  ���� ���������. ��������� ��� ��������� � ������������.

compromise_rep(List, 0, []):-!.

compromise_rep(List, Length, [Value|Sublist]):-
  member(Value, List),
  SublistLength is Length - 1,
  compromise_rep(List, SublistLength, Sublist).

% 2 ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 5, � ������� ����� ��� ����� a. ����� � ����.

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
  permutation(5,[a,b,c,d,e,f],Res), % �������� ��� ���������� ������� ������� ����� 5
  find_count(Res, a, 2), % ����� ����, � ������� ���������� ��������� 'a' ����� 2
%  write(Res), nl, fail.
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write), fail.

% 3 ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 5,
% � ������� ����� 2 ����� a, ��������� ����� �� �����������. ����� � ����.

check_uniq([], Word).
check_uniq([a|Tail], Word):-
  check_uniq(Tail, Word).
check_uniq([Head|Tail], Word):-
  check_uniq(Tail, Word),
  find_count(Word, Head, 1).


task_3:-
  permutation(5,[a,b,c,d,e,f],Res),
  find_count(Res, a, 2),
  check_uniq(Res, Res), % ����� ����, ��� ��� �����, ����� 'a', ���������, �� ���� ����������� 0 ��� 1 ���
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 4 ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 5, �
% ������� ����� ���� ����� ����������� 2 ����, ��������� ����� ��
% �����������. ����� � ����.

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
  find_2_count(Res, [a,b,c,d,e,f], 1), % �������, ����� ���������� ���������� ��� ���� ��������� 1
  find_uniq_count(Res, Res, 3), % ���������� ���������� ���� ������ ��������� 3
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 5 ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 6, �
% ������� ����� 2 ����� ����������� 2 ����, ��������� ����� ��
% �����������. ����� � ����.

task_5:-
  permutation(6,[a,b,c,d,e,f],Res),
  find_2_count(Res, [a,b,c,d,e,f], 2),
  find_uniq_count(Res, Res, 2),
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 6 ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 7, �
% ������� ����� 1 ����� ����������� 2 ����, ����� ���� ����� �����������
% 3 ���� ��������� ����� �� �����������. ����� � ����.

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

% 7 ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 9, �
% ������� ����� 2 ����� ����������� 2 ����, ����� ���� ����� �����������
% ��� ����, ��������� ����� �� �����������. ����� � ����.

task_7:-
  permutation(9,[a,b,c,d,e,f],Res),
  find_2_count(Res, [a,b,c,d,e,f], 2),
  find_3_count(Res, [a,b,c,d,e,f], 1),
  find_uniq_count(Res, Res, 2),
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).

% 8 ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 4,
% � ������� ������ ���� ���� �. ����� � ����.

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

% 9 ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 7, �
% ������� ������ ���� ���� �. ����� � ����.


task_9:-
  permutation(7,[a,b,c,d,e,f],Res),
  find_count(Res, a, Count),
  check_count(Count),
  open('8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write).


% 10 ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 7, �
% ������� ����� 4 ��������� �����. �������������� �������*. ����� �
% ����.

task_10:-
  permutation(7,[a,b,c,d,e,f],Res),
  %find_count(Res, a, Count),
  find_uniq_count(Res, Res, 4),
  open('C:/Users/User/Desktop/�����/4 ����/prolog_labs/8.txt', append, Write),
  write(Write, Res),
  write(Write,"\n"),
  close(Write),
  fail.


